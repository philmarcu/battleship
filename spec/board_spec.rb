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
    expect(board.cells.keys[0]).to eq("A1")
    expect(board.cells.keys[15]).to eq("D4")
  end

  it 'will tell us T/F if coordinate exists' do
    expect(board.valid_coordinate?("A4")).to eq(TRUE)
end


end
