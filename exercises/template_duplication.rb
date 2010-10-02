# Lesson: fully understand CODE INTENTION before applying naive refactorings

# Original code
module Template
  def template(source_template, req_id)
    template = String.new(source_template)
    
    # Substitute for %CODE%
    template_split_begin = template.index("%CODE%")
    template_split_end = template_split_begin + 6
    template_part_one = String.new(template[0..(template_split_begin-1)])
    template_part_two = String.new(template[template_split_end..template.length])
    code = String.new(req_id)
    template = String.new(template_part_one + code + template_part_two)
    
    # Substitute for %ALTCODE%
    template_split_begin = template.index("%ALTCODE%")
    template_split_end = template_split_begin + 9
    template_part_one = String.new(template[0..(template_split_begin-1)])
    template_part_two = String.new(template[template_split_end..template.length])
    altcode = code[0..4] + "-" + code[5..7]
    
    puts template_part_one + altcode + template_part_two
  end
end

# Naive refactoring (didn't understand that template replaces code/altcode markers
module Template
    def template(source_template, req_id)
    code_template = code_from String.new(source_template), "%CODE%", 6
    template = String.new(code_template[0] + String.new(req_id) + code_template[1])
  
    alt_code_template = code_from code_template, "%ALTCODE%", 9
    altcode = code[0..4] + "-" + code[5..7]
    
    puts alt_code_template[0] + altcode + alt_code_template[1]
  end
  
  private
  
  def code_from(template, name, end_offset)
    template_split_begin = template.index(name)
    template_split_end = template_split_begin + end_offset
    [ String.new(template[0..(template_split_begin-1)]),
      String.new(template[template_split_end..template.length]) ]
  end
end

# Complete refactoring
module Template
  def template(source, req_id)
    altcode = req_id[0..4] + "-" + req_id[5..7]
    source.sub(/%CODE%/, req_id).sub(/%ALTCODE%/, altcode)
  end
end
