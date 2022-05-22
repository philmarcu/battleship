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

  def is_occupied?(coordinates)
    coordinates.one? {|coord| !@cells[coord].empty?}
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
    nums = coord.map {|coord| coord.slice(1).to_i}
    pass = false
    if ship.length != coord.count
      pass = false
    elsif is_occupied?(coord) == true
      pass = false
    elsif horizontal_check(coord) == true && is_consecutive?(nums)
      pass = true
    elsif vertical_check(coord) == true
      pass = true
    elsif diagonal_check(coord) == true
      pass = false
    end
    pass
  end

  def place(ship_type, placement_array)
    valid = valid_placement?(ship_type, placement_array)
    if valid
      i = 0
      @cells.each do |cell|
        if cell.last.coordinate == placement_array[i]
          @cells[placement_array[i]].place_ship(ship_type)
          i += 1
        end
      end
    end
  end

  def render(reveal = false)
    puts " 1 2 3 4"
    letters = []
    nums = []
    @cells.each do |cell|
      letters << cell.last.coordinate.slice(0)
      nums << cell.last.coordinate.slice(1)
    end

    if reveal == true
      i = 0
      4.times do
        place0 = @cells["#{letters[i]}1"]
        place1 = @cells["#{letters[i]}2"]
        place2 = @cells["#{letters[i]}3"]
        place3 = @cells["#{letters[i]}4"]

        output = "#{letters[i]} #{place0.render(true)} #{place1.render(true)} #{place2.render(true)} #{place3.render(true)}"
        i += 4
        puts output
      end
    elsif
      i = 0
      4.times do
        place0 = @cells["#{letters[i]}1"]
        place1 = @cells["#{letters[i]}2"]
        place2 = @cells["#{letters[i]}3"]
        place3 = @cells["#{letters[i]}4"]

        output = "#{letters[i]} #{place0.render} #{place1.render} #{place2.render} #{place3.render}"
        i += 4
        puts output
      end
    end
  end
end
