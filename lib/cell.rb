class Cell

  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if !empty?
      @ship.hit
    end
  end

  def render(reveal = false)
    if reveal == true && !empty? && @fired_upon == false
      "S"
    elsif reveal == false && !empty? && @fired_upon == false
      "."
    elsif @fired_upon == true && !empty? && @ship.sunk?
      "X"
    elsif @fired_upon == true && !empty? && !@ship.sunk?
      "H"
    elsif @fired_upon == true && empty?
      "M"
    elsif @fired_upon == false && empty?
      "."
    end
  end
end
