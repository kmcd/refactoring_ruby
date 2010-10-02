class Report
  def self.report(out, machines, robot)
    @out, @robot = out, robot
    
    report_header
    
    # push down reporting to object style
    machines.each {|machine| machine.report(@out) }
    robot.report out
    
    # Feature Envy is better than Shotgun Surgery in this case.
    # Report is more likely to change than Machine/Robot
    bin_report
  end
  
  private
  
  def self.report_header
    @out.puts "FACTORY REPORT"
  end
  
  def self.bin_report
    @out.print " bin=#{@robot.bin}" if @robot.bin
    @out.print "\n"
    @out.print "========\n"
  end
end