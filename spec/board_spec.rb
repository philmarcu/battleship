require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

RSpec.describe Board do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  it 'exists & has attributes' do 
    expect(board).to be_a(Board)
    expect(board.cells).to be_a(Hash)
    expect(board.cells.size).to eq(16)
    expect(board.cells.keys[3]).to eq("A4")
    expect(board.cells.keys[15]).to eq("D4")
  end

  it 'will tell us T/F if coordinate exists' do
    expect(board.valid_coordinate?("A4")).to eq(true)
  end


    it 'will tell us if consecutive' do
      expect(board.is_consecutive?([1, 2, 3])).to eq(true)
      expect(board.is_consecutive?([4, 4])).to eq(false)
      expect(board.is_consecutive?([2, 3, 4])).to eq(true)
      expect(board.is_consecutive?([3, 4])).to eq(true)
      expect(board.is_consecutive?([3, 2, 1])).to eq(false)
    end

end
