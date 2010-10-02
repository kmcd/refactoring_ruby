class CsvWriter
  def write(lines)
    lines.map { |line| write_line(line) }.join "\n"
  end

  private

  def write_line(fields)
    lines.map {|field| write_field(field) }.join ","
  end
  
  def write_field(field)
    case field
      when /,/ : quote_and_escape(field)
      when /"/ : quote_and_escape(field)
      else 
        field
    end
  end

  def quote_and_escape(field)
    "\"#{field.gsub(/\"/, "\"\"")}\""
  end
end
