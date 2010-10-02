class Agency
  def self.book(num_reqd, theater)
    return if theater.free_seats.empty?
    theater.free_seats[0..num_reqd]
  end
end
