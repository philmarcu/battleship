require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  cell = Cell.new("B4")

  it 'exists & has attributes' do
    expect(cell).to be_a(Cell)
    expect(cell.coordinate).to eq("B4")
    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to eq(true)
  end

  describe 'ship placement & cell fired upon' do
    cruiser = Ship.new("Cruiser", 3)

    it 'can store a ship in a cell' do
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
    end

    it 'is not fired upon by default' do
      expect(cell.fired_upon?).to eq(false)
    end

    it 'can fire upon a ship' do
      cell.place_ship(cruiser)
      cell.fire_upon

      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end
  end
  describe "#render method" do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    it 'can show the contents in a cell' do
      expect(cell_1.render).to eq(".")
    end

    xit 'can reveal a ship if its placed' do
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq("S")
    end
  end
end
