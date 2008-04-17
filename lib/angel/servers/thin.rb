module Angel
  def self.start_thin(config)
    "thin start " + [['-d'],
     ['-p', config['port']],
     ['-c', config['cwd']],
     ['-a', config['address']],
     ['-P', config['pid_file']],
     ['-l', config['log_file']],
     ['-e', config['environment']]].join(' ')
  end

  def self.stop_thin(config)
    "thin stop -P #{config['pid_file']}"
  end

  def self.restart_thin(config)
    "thin restart -P #{config['pid_file']}"
  end
end
