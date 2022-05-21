require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  cell = Cell.new("B4")

  it 'exists & has attributes' do ##
    expect(cell).to be_a(Cell)
    expect(cell.coordinate).to eq("B4")
    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to eq(true)
  end

  describe 'ship placement & cell fired upon' do
    cruiser = Ship.new("Cruiser", 3)

    it 'can place a ship into a cell' do ##
      cell.place_ship(cruiser)

      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end

    it 'is not fired upon by default' do
      expect(cell.fired_upon?).to eq(false)
    end

    it 'can fire upon a ship' do ##
      cell.fire_upon

      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end
  end

  describe "#render method" do ##
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    it 'can show the contents in a cell' do ##
      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")
    end

    it 'can be fired upon and reveal a miss or hit' do
      cell_1.fire_upon
      cell_2.place_ship(cruiser)
      cell_2.fire_upon

      expect(cell_1.render).to eq("M")
      expect(cell_2.render).to eq("H")
      expect(cruiser.health).to eq(2)
    end
  end

  describe 'render reveal' do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cell_3 = Cell.new("D3")
    cruiser = Ship.new("Cruiser", 3)

    it 'can reveal a ship if its placed' do
      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")

      cell_2.place_ship(cruiser)
      cell_3.place_ship(cruiser)

      expect(cell_2.render(true)).to eq("S")
      expect(cell_3.render).to eq(".")
    end
  end

  describe 'condition for dead ship' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    it 'can tell if a ship is dead' do
      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      cruiser.hit
      expect(cruiser.health).to eq(1)
      cruiser.hit

      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq("X")
    end
  end


end

# Need test that shows if ship is near dying, last hit will turn all other H hits into X.
# If ship.health == 1 & fired_upon == true, return "X"
# If ship.sunk == true, change all "H" strings to "X"
# Will probably need test to assure you can't hit the same cell twice
