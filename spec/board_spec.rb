require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  it 'exists & has attributes' do
    expect(board).to be_a(Board)
    expect(board.cells).to be_a(Hash)
    expect(board.cells.size).to eq(16)
    expect(board.cells.keys[0]).to eq("A1")
    expect(board.cells.keys[15]).to eq("D4")
  end

  it 'can validate coordinates' do
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'can tell if place is #valid_placement' do
  end
end
