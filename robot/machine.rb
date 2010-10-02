class Machine
  attr_reader :name, :bin

  def initialize(name, location)
    @name = name
    @location = location
  end

  def take
    result = @bin
    @bin = nil
    return result
  end	

  def put(bin)
    @bin = bin
  end
  
  def report(out)
    out.print "Machine #{name}"
    out.print " bin=#{bin}" if bin
    out.puts
  end
end