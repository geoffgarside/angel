$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Angel
  def self.stop(server_type, *args)
    self.send(:"stop_#{server_type}", options_from_array_of_hashes(args))
  end
  
  def self.start(server_type, *args)
    self.send(:"start_#{server_type}", options_from_array_of_hashes(args))
  end
  
  def self.restart(server_type, *args)
    self.send(:"restart_#{server_type}", options_from_array_of_hashes(args))    
  end
  
  def self.options_from_array_of_hashes(args)
    args.inject({}) { |options, hash| options.merge(hash) }
  end
  
  def self.pid_file(*args)
    options = options_from_array_of_hashes(args)
    pid_file = options[:pid_file] || File.join(options[:cwd], "log/server.pid")
    
    options[:port] ? pid_file.gsub(/\.pid$/, ".#{options[:port]}.pid") : pid_file
  end
  
  def self.log_file(*args)
    options = options_from_array_of_hashes(args)
    log_file = options[:log_file] || File.join(options[:cwd], "log/server.log")
    
    options[:port] ? log_file.gsub(/\.log$/, ".#{options[:port]}.log") : log_file
  end
  
  def self.setup(w)
    # clean pid file before start if necessary
    w.behavior(:clean_pid_file)

    # determine state on god startup
    w.transition(:init, { true => :up, false => :start }) do |on|
      on.condition(:process_running) do |c|
        c.running = true
      end
    end

    # determine when process has finished starting
    w.transition([:start, :restart], :up) do |on|
      on.condition(:process_running) do |c|
        c.running = true
      end
  
      # failsafe
      on.condition(:tries) do |c|
        c.times = 5
        c.transition = :start
      end
    end

    # start if process is not running
    w.transition(:up, :start) do |on|
      on.condition(:process_exits)
    end

    # Restart if memory or cpu usage is too high
    w.transition(:up, :restart) do |on|
      on.condition(:memory_usage) do |c|
        c.interval = 20
        c.above = 50.megabytes
        c.times = [3,5] # three out of five intervals
      end
  
      on.condition(:cpu_usage) do |c|
        c.interval = 10
        c.above = 10.percent
        c.times = [3,5] # three out of five intervals
      end
    end

    # Life!!!
    w.lifecycle do |on|
      on.condition(:flapping) do |c|
        c.to_state     = [:start, :restart]
        c.times        = 5
        c.within       = 5.minutes
        c.transition   = :unmonitored
        c.retry_in     = 10.minutes
        c.retry_times  = 5
        c.retry_within = 2.hours
      end
    end
  end
end

require 'angel/servers'