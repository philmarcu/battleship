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

  describe '#valid_placement #is_consecutive?' do
    it 'can tell if a place is #valid_placement? consecutively' do
      @board.cells.values[0].place_ship(@cruiser)
      @board.cells.values[1].place_ship(@cruiser)
      @board.cells.values[3].place_ship(@cruiser)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    end
  end

  describe 'able to #place' do
    before do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
      @submarine = Ship.new("Submarine", 2)
      @cell_1 = @board.cells["A1"]
      @cell_2 = @board.cells["A2"]
      @cell_3 = @board.cells["A3"]
      @cell_4 = @board.cells["B2"]
      @cell_5 = @board.cells["B3"]
    end

    it 'will place' do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      @board.place(@submarine, ["B2", "B3"])
      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_2.ship).to eq(@cruiser)
      expect(@cell_3.ship).to eq(@cruiser)
      expect(@cell_4.ship).to eq(@submarine)
      expect(@cell_5.ship).to eq(@submarine)

    end
  end

  describe 'does not overlap' do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
  it 'will return false when attempted overlap' do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["A1", "B1"])
    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
  end


  describe 'render conditions' do
    before do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
    end

    it 'renders the board empty to start' do
      expect(@board.render). to eq("  1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
    end

    it 'renders the board with ship conditions' do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      @cell_1 = @board.cells["A1"]
      @cell_2 = @board.cells["A2"]
      @cell_3 = @board.cells["A3"]


      expect(@cell_1.render(true)).to eq("S")
      expect(@cell_2.render(true)).to eq("S")
      expect(@cell_3.render(true)).to eq("S")
      expect(@board.render(true)).to eq("  1 2 3 4\nA S S S .\nB . . . .\nC . . . .\nD . . . .\n")
    end
  end

  describe 'render conditions' do
    before do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
    end

    it 'checks to make sure Hit, Miss, and Sunk are read on board' do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      @board.place(@submarine, ["B2", "B3"])
      @cell_1 = @board.cells["A1"]
      @cell_2 = @board.cells["A2"]
      @cell_3 = @board.cells["A3"]
      @cell_4 = @board.cells["B2"]
      @cell_5 = @board.cells["B3"]
      @cell_6 = @board.cells["B4"]

      @cell_4.fire_upon
      @cell_5.fire_upon
      @cell_6.fire_upon
      @cell_3.fire_upon

      expect(@board.render).to eq("  1 2 3 4\nA . . H .\nB . X X M\nC . . . .\nD . . . .\n")
      expect(@cell_3.render(true)).to eq("H")
      expect(@cell_6.render(true)).to eq("M")
      expect(@cell_5.render(true)).to eq("X")
    end
  end
end
