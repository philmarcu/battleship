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

  it 'can store a ship in a cell' do
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
  end
end
