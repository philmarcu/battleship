require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  it 'exists & has attributes' do #testing cells done
    expect(board).to be_a(Board)
    expect(board.cells).to be_a(Hash)
    expect(board.cells.size).to eq(16)
    expect(board.cells.keys[3]).to eq("A4")
    expect(board.cells.keys[15]).to eq("D4")
  end

  it 'will tell us T/F if coordinate exists' do
    expect(board.valid_coordinate?("A4")).to eq(true)
end

  it 'will only allow consecutive coords, not diagnol' do
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(false) #fail diagonal test for cruiser
    expect(board.valid_placement?(cruiser,["A3", "A2", "A1"])).to eq(false) #fail reverse order test for cruiser
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)  #fail check consecutive for sub
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)  # fail diagonal for sub
    expect(board.valid_placement?(submarine,["A1", "A2"])).to eq(true) #pass sub
    expect(board.valid_placement?(cruiser,["B1", "C1", "D1"])).to eq(true) #pass cruiser
  end
end
