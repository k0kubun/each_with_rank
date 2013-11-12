module Enumerable
  def each_with_rank
    rank = 1
    last_number = nil
    self.each_with_index do |number, index|
      if last_number != number
        rank = index + 1
        last_number = number
      end
      yield [number, rank]
    end
  end

  def each_with_rank_by(symbol)
    rank = 1
    last_number = nil
    self.each_with_index do |object, index|
      number = object.send(symbol)
      if last_number != number
        rank = index + 1
        last_number = number
      end
      yield [object, rank]
    end
  end
end
