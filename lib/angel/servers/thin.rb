module Angel
  def self.start_thin(config)
    "thin start " + [['-d'],
     ['-p', config[:port]],
     ['-c', config[:cwd]],
     ['-a', config[:address] || "127.0.0.1"],
     ['-P', pid_file(config)],
     ['-l', log_file(config)],
     ['-e', config[:environment]]].join(' ')
  end

  def self.stop_thin(config)
    "thin stop -P #{pid_file(config)}"
  end

  def self.restart_thin(config)
    "thin restart -P #{pid_file(config)}"
  end
end
