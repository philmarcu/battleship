class Cell

  attr_reader :coordinate, :ship, :empty, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @empty = true
    @fired_upon = false
  end

  def empty?
    if ship != nil
      @empty = false
    else
      @empty = true
    end
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def render(reveal = false)
    if reveal == true && @empty == false && @fired_upon == false
      "S"
    elsif @fired_upon == true && @empty == false && @ship.sunk?
      "X"
    elsif @fired_upon == true && @empty == false && !@ship.sunk?
      "H"
    elsif @fired_upon == true && @empty == true
      "M"
    elsif @fired_upon == false && @empty == true
      "."
    end
  end
end
