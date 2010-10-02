# Procedural
class Cart
  def total_price
    total = 0
    @items.each { |item| total += item.price }
    return total
  end
end

# Functional, still greedy due to price fetching & summing
class Cart
  def total_price
    @items.inject(0) {|total, item| total += item.price }
  end
end

# Non greedy functional 
require 'active_support'

class Cart
  def total_price
    @items.map(&:price).reduce :+
  end
end
