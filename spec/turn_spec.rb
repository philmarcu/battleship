require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/game_manager'

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

   it 'exists' do
    expect(@turn).to be_a(Turn)
  end

  it 'can render the comp_board' do
    expect(@turn.comp_board.render).to eq("  1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
  end

  xit 'can collect computer & player shots' do
    expect(@turn.comp_choice).to be_a(String)
  end

  it 'can get #feedback' do
    @player_board.place(@play_cruiser,["A1", "B1", "C1"])
    @player_board.place(@play_submarine, ["D1", "D2"])
    @comp_board.place(@comp_cruiser,["C2", "C3", "C4"])
    @comp_board.place(@comp_submarine, ["B3", "B4"])
    @comp_board.cells["B4"].fire_upon
    @comp_board.cells["B3"].fire_upon
    expect(@turn.cpu_feedback("B4")).to eq(false)
  end
end
