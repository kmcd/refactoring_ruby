def display_full_name(out, person)
  out.write(person.first)
  out.write(" ")
  if person.middle != nil
    out.write(person.middle)
    out.write(" ")
  end
  out.write(person.last)
end

class Person
  def full_name
    [ first, middle, last ].compact.join ' '
  end
end

def display(out, full_name)
  out.write full_name
end
