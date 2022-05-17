class Ship

  attr_reader :name,
              :length,
              :health,
              :sunk

  def initialize(name, length) #ship type, ship length
    @name = name #ship type
    @length = length #ship attribute
    @health = @length #health = how many increments
    @sunk = false
  end

  def sunk?
    @health < 1 #if health = 0
  end

  def hit
    @health -= 1 #health = health - 1
  end #do we want it to return the current health or nil?
end
