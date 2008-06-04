module Angel
  def self.start_ebb(config)
    "ebb_rails start " + [['-d'],
     ['-p', config[:port]],
     ['-c', config[:cwd]],
     ['-P', pid_file(config)],
     ['-l', log_file(config)],
     ['-e', config[:environment]]].join(' ')
  end

  def self.stop_ebb(config)
    "ebb_rails stop -P #{pid_file(config)}"
  end

  def self.restart_ebb(config)
    stop_ebb(config) + " && " + start_ebb(config)
  end  
end
