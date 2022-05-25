require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

RSpec.describe Turn do
  before :each do


    @comp_board = Board.new
    @player_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
    @play_cruiser = Ship.new("Cruiser", 3)
    @play_submarine = Ship.new("Submarine", 2)
    @turn = Turn.new(@comp_board, @player_board)
  end

   xit 'exists' do
    expect(@turn).to be_a(Turn)
  end

  xit 'can render the comp_board' do
    expect(@turn.comp_board.render).to eq(" 1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
  end

  xit 'comp_shots' do
    expect(@turn.comp_choice).to be_a(Cell)
  end

  xit 'player can make a shot' do

  end

  it "returns feedback" do

    expect(@turn.feedback("A4", "C1")).to eq("Your shot on A4 was a miss")
  end
end
