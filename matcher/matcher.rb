class Matcher
  def match(expected, actual, clip_limit, delta)
    return false unless actual.length == expected.length
    
    similar_values?(expected, clip(actual, clip_limit), delta)
  end
  
  private
  
  def clip(array, limit)
    array.map {|val| [val, limit].min }
  end
  
  def similar_values?(expected, actual, delta)
    actual.zip(expected).none? {|exp,act| (exp - act).abs > delta }
  end
end
