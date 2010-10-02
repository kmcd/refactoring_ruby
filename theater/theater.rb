class Theater
  attr_reader :seats

  def initialize(seats)
    @seats = seats.split(//)
  end

  def free_seats
    fs = []
    @seats.each_with_index do |item, index|
      fs << index if item == '-'
    end
    fs
  end
end
