module Angel
  def self.start_mongrel(config)
    "mongrel_rails start " + [['-d'],
     ['-p', config['port']],
     ['-c', config['cwd']],
     ['-a', config['address']],
     ['-P', config['pid_file']],
     ['-l', config['log_file']],
     ['-e', config['environment']]].join(' ')
  end

  def self.stop_mongrel(config)
    "mongrel_rails stop -P #{config['pid_file']}"
  end

  def self.restart_mongrel(config)
    "mongrel_rails restart -P #{config['pid_file']}"
  end
end
