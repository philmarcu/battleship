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

  def is_occupied?(coordinates)
    coordinates.one? {|coord| !@cells[coord].empty?}
  end

  def horizontal_check(coordinates)
    nums = coordinates.map {|coord| coord.slice(1).to_i}
    letters = coordinates.map  {|coord| coord.slice(0)}
    (letters.uniq.count == 1 && (nums.min..nums.max).to_a == nums)
  end

  def vertical_check(coordinates)
    nums = coordinates.map {|coord| coord.slice(1).to_i}
    letters = coordinates.map  {|coord| coord.slice(0)}
    (letters.min..letters.max).to_a == letters && nums.uniq.count == 1
  end

  def diagonal_check(coordinates)
    nums = coordinates.map {|coord| coord.slice(1).to_i}
    letters = coordinates.map  {|coord| coord.slice(0)}
    (letters.min..letters.max).to_a == letters && (nums.min..nums.max).to_a == nums
  end

  def valid_placement?(ship, coord)
    if ship.length != coord.count
      false
    end
  end
end
