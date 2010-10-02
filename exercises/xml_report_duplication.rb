# Duplication: xml row building
# Other smells: row/colum classses identical
# 2 solutions: XMLBuilder for rows

# Before refactoring
class ReportRow
  def to_xml
    result = "<row>\n"
    
    @columns.each do |col|
      result += col.print + "\n"
    end
    
    return result + "</row>"
  end
end

class ReportColumn
  def print
    "<column>#{@value.modulo(100)}</column>"
  end
end

# After refactoring
class ReportRow
  def value
    @columns.inject {|report, col| report += col.print + "\n" }
  end
  
  # TODO: push up to super class & use tag_name
  def to_xml
    xml = XMLBuilder.new
    xml.element :row { value }
  end
end

class ReportColumn
  # TODO: push up to super class & use tag_name
  def to_xml
    xml = XMLBuilder.new
    xml.element :column { value }
  end
  
  def value
    @value.modulo(100)
  end
end

class XMLBuilder
  def element(name)
    element_name = name.to_s
    
    result = "<#{element_name}>\n"
    result += yield
    result + "</#{element_name}>"
  end
end

# Using Form Template Method
class ReportNode
  def to_xml
    # TODO: use XmlBuilder gem
    result = "<#{tagname}>\n"
    result += value
    result + "</#{tagname}>"
  end
end

class ReportRow < ReportNode
  def tagname
    'row'
  end
  
  def value
    @columns.inject {|report, col| report += col.print + "\n" }
  end
end

class ReportColumn < ReportNode
  def tagname
    'column'
  end
  
  def value
    @value.modulo(100)
  end
end

# Using Helper module
module NodeFormatter
  def to_xml
    result = "<#{tagname}>\n"
    result += value
    result + "</#{tagname}>"
  end
end

class ReportRow
  include NodeFormatter
  
  def tagname
    'row'
  end
  
  def value
    'foo'
  end
end
