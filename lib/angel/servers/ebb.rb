module Angel
  def self.start_ebb(config)
    "ebb_rails start " + [['-d'],
     ['-p', config['port']],
     ['-c', config['cwd']],
     ['-P', config['pid_file']],
     ['-l', config['log_file']],
     ['-e', config['environment']]].join(' ')
  end

  def self.stop_ebb(config)
    "ebb_rails stop -P #{config['pid_file']}"
  end

  def self.restart_ebb(config)
    stop_ebb + " && " + start_ebb
  end  
end
