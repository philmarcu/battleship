class Cell

  attr_reader :coordinate, :ship, :empty
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @empty = true
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
  end
end
