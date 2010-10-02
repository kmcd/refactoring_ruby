class Robot
  attr_reader :location, :bin

  def move_to(location)
    @location = location
  end

  def pick
    @bin = @location.take
  end

  def release
    @location.put(@bin)
    @bin = nil
  end
  
  def report(out)
    out.puts
    out.print "Robot"
    out.print " location=#{location.name}" if location
  end
end