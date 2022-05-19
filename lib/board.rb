class Board

  attr_reader :cells
  def initialize
    @cells = {
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4")
          }
  end

  def valid_coordinate?(coord)
    @cells.any? {|cell| cell.include?(coord)}
  end

  def is_consecutive?(coord_array)
    length = coord_array.length
    pass_test = false

    i = 0
    while i < length - 1
      if coord_array[i + 1] == coord_array[i].to_i + 1
        pass_test = true
      else
        pass_test = false
      end
      i += 1
    end

    pass_test
  end


end
