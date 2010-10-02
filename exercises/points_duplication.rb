# bird.rb
require 'point.rb'

module WrappedPoint
  def limit(coord,max)
    coord % max
  end
end

class Bird
  attr_accessor :location
  include WrappedPoint
  
  def initialize(max_x, max_y)
    @max_x = max_x
    @max_y = max_y
    @location = Point.new 0, 0   
  end
  
  def move_by(point)   
    @location.x = limit @location.x + point.x, @max_x
    @location.y = limit @location.y + point.y @max_y
  end
end                              

class Button                                           
  attr_accessor :name
  attr_accessor :x, :y       
  include WrappedPoint
  
  def initialize(name, x_limit, y_limit)
    @name = name
    @xmax = x_limit          
    @ymax = y_limit
    @x = 0
    @y = 0
  end
  
  def move_to(x, y)
    @x = limit(x, @xmax)
    @y = limit(y, @ymax)
  end
end

