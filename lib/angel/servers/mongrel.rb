module Angel
  def self.start_mongrel(config)
    "mongrel_rails start " + [['-d'],
     ['-p', config[:port]],
     ['-c', config[:cwd]],
     ['-a', config[:address] || "127.0.0.1"],
     ['-P', pid_file(config)],
     ['-l', log_file(config)],
     ['-e', config[:environment]]].join(' ')
  end

  def self.stop_mongrel(config)
    "mongrel_rails stop -P #{pid_file(config)}"
  end

  def self.restart_mongrel(config)
    "mongrel_rails restart -P #{pid_file(config)}"
  end
end
