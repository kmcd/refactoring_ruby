=begin
# Before refactoring
class ArrayQueue < Array
  def add_rear(s)
    self << s
  end

  def remove_front
    self.delete_at(0)
  end
end 
=end

# Original is an example of Implementation Inheritance; subclassing is used purely to reuse code
# Using Replace Inheritance with Delegation:
class ArrayQueue          
  def initialize
    @queue = Array.new
  end
  
  def add_rear(s)
    @queue << s
  end

  def remove_front
    @queue.delete_at(0)
  end
  
  def length
    @queue.length
  end
end
