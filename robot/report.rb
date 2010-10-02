class Report
  def self.report(out, machines, robot)
    @out, @machines, @robot = out, machines, robot
    report_header
    machine_report
    
    # push down reporting to object style
    robot.report out
    
    bin_report
  end
  
  private
  
  def self.report_header
    @out.puts "FACTORY REPORT"
  end
  
  def self.machine_report
    @machines.each do |machine|
      @out.print "Machine #{machine.name}"
      @out.print " bin=#{machine.bin}" if machine.bin
      @out.puts
    end
  end
  
  def self.bin_report
    @out.print " bin=#{@robot.bin}" if @robot.bin
    @out.print "\n"
    @out.print "========\n"
  end
end