module Timer
  def times(env)
    value_s = env['interval']
    if value_s == nil
      raise "interval missing"
    end
    value = Integer(value_s)
    if value <= 0
      raise "interval should be > 0"
    end
    check_interval = value
    value_s = env['duration']
    raise "duration missing" if value_s.nil?
    value = Integer(value_s)
    if value <= 0
      raise "duration should be > 0"
    end
    if (value % check_interval) != 0
      raise "duration should be multiple of interval"
    end
    monitor_time = value
    value_s = env['departure']
    if value_s.nil?
      raise "departure missing"
    end
    value = Integer(value_s)
    raise "departure should be > 0" if value <= 0
    if (value % check_interval) != 0
      raise "departure should be multiple of interval"
    end
    departure_offset = value
    [check_interval, monitor_time, departure_offset]
  end
end

# Duplication: integer & multiple setting

module Timer
  def integer(env_key)
    value_s = env[env_key]
    raise "interval missing" unless value_s
    value = Integer(value_s)
    raise "interval should be > 0" if value <= 0
  en
  
  def multiple(env_key,check_interval)
    value_s = integer env_key
    raise "duration should be multiple of interval" if (value % check_interval) != 0
  end
  
  def times(env)
    check_interval = integer 'interval'
    
    monitor_time  = multiple 'duration', check_interval
    departure    = multiple 'departure', check_interval
    
    [check_interval, monitor_time, departure]
  end
end
