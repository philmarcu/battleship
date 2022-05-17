require './lib/ship'

RSpec.describe Ship do
  cruiser = Ship.new("Cruiser", 3)

  it 'exists & has attributes' do
    expect(cruiser).to be_a(Ship)
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
    expect(cruiser.health).to eq(cruiser.length)
    expect(cruiser.sunk?).to eq(false)
  end

  it 'can get hit by a missile' do
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end

  it 'can sink a ship' do
    cruiser.hit
    expect(cruiser.health).to eq(1)
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
  end
end
