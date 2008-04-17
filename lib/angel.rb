$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Angel
  def self.set_pid_file(config)
    unless config['pid_file'][0].chr == '/'
      config['pid_file'] = File.join(config['cwd'], config['pid_file'])
    end

    config['pid_file'] = config['pid_file'].gsub(/\.pid$/, ".#{config['port']}.pid")
  end

  def self.set_log_file(config)
    unless config['log_file'][0].chr == '/'
      config['log_file'] = File.join(config['cwd'], config['log_file'])
    end

    config['log_file'] = config['log_file'].gsub(/\.log$/, ".#{config['port']}.log") 
  end

  def self.process_name(config)
    "#{config['app']}-cluster-#{config['port']}"
  end

  def self.start_cmd(config)
    self.send(:"start_#{config['web_server']}", config)
  end

  def self.stop_cmd(config)
    self.send(:"stop_#{config['web_server']}", config)
  end

  def self.restart_cmd(config)
    self.send(:"restart_#{config['web_server']}", config)
  end
end

require 'angel/servers'