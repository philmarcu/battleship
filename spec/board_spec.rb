require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before :each do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists & has attributes' do
    expect(@board).to be_a(Board)
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.size).to eq(16)
    expect(@board.cells.keys[0]).to eq("A1")
    expect(@board.cells.keys[15]).to eq("D4")
    expect(@board.cells.values[5]).to be_a(Cell)
  end

  describe 'occupied & valid coordinate tests' do
    before do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
    end

    it 'can validate coordinates' do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end

    it 'can tell if coordinate #is_occupied?' do
      @board.cells.values[0].place_ship(@cruiser)
      @board.cells.values[1].place_ship(@cruiser)
      @board.cells.values[2].place_ship(@cruiser)

      expect(@board.is_occupied?(["A1"])).to eq(true)
      expect(@board.is_occupied?(["A2"])).to eq(true)
      expect(@board.is_occupied?(["A3"])).to eq(true)

      expect(@board.is_occupied?(["A4"])).to eq(false)
      expect(@board.is_occupied?(["B1"])).to eq(false)
      expect(@board.is_occupied?(["D2"])).to eq(false)
    end

    it 'will tell us if consecutive' do
      expect(@board.is_consecutive?([1, 2, 3])).to eq(true)
      expect(@board.is_consecutive?([4, 4])).to eq(false)
      expect(@board.is_consecutive?([2, 3, 4])).to eq(true)
      expect(@board.is_consecutive?([3, 4])).to eq(true)
      expect(@board.is_consecutive?([3, 2, 1])).to eq(false)
    end
  end

  describe 'vertical check' do
    before do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
    end

    it 'can make a #vertical_check' do
      @board.cells.values[0].place_ship(@cruiser)
      @board.cells.values[4].place_ship(@cruiser)
      @board.cells.values[8].place_ship(@cruiser)
      expect(@board.vertical_check(["A1", "B1", "C1"])).to eq(true)
      expect(@board.vertical_check(["A1", "B2", "C1"])).to eq(false)
    end
  end

  it 'will tell us if consecutive' do
    expect(@board.is_consecutive?([1, 2, 3])).to eq(true)
    expect(@board.is_consecutive?([4, 4])).to eq(false)
    expect(@board.is_consecutive?([2, 3, 4])).to eq(true)
    expect(@board.is_consecutive?([3, 4])).to eq(true)
    expect(@board.is_consecutive?([3, 2, 1])).to eq(false)
  end

  describe " horizontal check & valid placement" do

    before do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
      @submarine = Ship.new("Submarine", 2)
    end

    it 'can make a #horizontal_check' do
      @board.cells.values[0].place_ship(@cruiser)
      @board.cells.values[1].place_ship(@cruiser)
      @board.cells.values[2].place_ship(@cruiser)
      expect(@board.horizontal_check(["A1", "A2", "A3"])).to eq(true)
      expect(@board.horizontal_check(["A1", "A2", "A4"])).to eq(false)
    end
  end

  describe 'diagonal check' do
    before do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
    end

    it 'can make a #diagonal_check' do
      @board.cells.values[0].place_ship(@cruiser)
      @board.cells.values[5].place_ship(@cruiser)
      @board.cells.values[10].place_ship(@cruiser)
      expect(@board.diagonal_check(["A1", "B2", "C3"])).to eq(true)
      expect(@board.diagonal_check(["A2", "B3", "C5"])).to eq(false)
    end
  end

  describe '#valid_placement length & occupied' do
    before do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
      @submarine = Ship.new("Submarine", 2)
    end

    it 'can tell if place is #valid_placement? in length' do
      @board.cells.values[0].place_ship(@cruiser)
      @board.cells.values[1].place_ship(@cruiser)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    end

    it 'can tell if place is valid depending on new ship`s length' do
      @board.cells.values[1].place_ship(@submarine)
      @board.cells.values[2].place_ship(@submarine)
      @board.cells.values[3].place_ship(@submarine)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'can tell if #valid_placement is false if occupied' do
      @board.cells.values[0].place_ship(@submarine)
      @board.cells.values[1].place_ship(@submarine)
      @board.cells.values[1].place_ship(@cruiser)
      expect(@board.valid_placement?(@cruiser, ["A2"])).to eq(false)
    end
  end

  describe '#valid_placement horizontal & vert' do
    it 'tells us if #valid_placement is true with #horizontal_check' do
      @board.cells.values[0].place_ship(@cruiser)
      @board.cells.values[1].place_ship(@cruiser)
      @board.cells.values[2].place_ship(@cruiser)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
    end

    it 'tells us if #valid_placement is true with #vertical_check' do
      @board.cells.values[0].place_ship(@cruiser)
      @board.cells.values[4].place_ship(@cruiser)
      @board.cells.values[8].place_ship(@cruiser)

      expect(@board.valid_placement?(@cruiser, ["A1", "B1", "C1"])).to eq(true)
    end
  end

  describe "#valid_placement"

  describe '#valid_placement #is_consecutive?' do
    it 'can tell if a place is #valid_placement? consecutively' do
      @board.cells.values[0].place_ship(@cruiser)
      @board.cells.values[1].place_ship(@cruiser)
      @board.cells.values[3].place_ship(@cruiser)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    end
  end
end
