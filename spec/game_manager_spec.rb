require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_manager'
require './lib/turn'


RSpec.describe Ship do
  before :each do
    @game = Game_Manager.new
    @comp_board = Board.new
    @player_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
    @play_cruiser = Ship.new("Cruiser", 3)
    @play_submarine = Ship.new("Submarine", 2)
    @turn = Turn.new(@comp_board, @player_board)
  end

  it 'exists' do
    expect(@game).to be_a(Game_Manager)
    expect(@comp_board).to be_a(Board)
  end

  it 'starts game and initilizes comp board' do
    expect(@comp_board.render(true)).to eq(" 1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
  end


  it 'players can place' do
    @player_board.place(@cruiser,["A1", "B1", "C1"])
    @player_board.place(@submarine, ["D1", "D2"])
    expect(@player_board.render(true)).to eq(" 1 2 3 4\nA S . . .\nB S . . .\nC S . . .\nD S S . .\n")
  end

  it 'can have the computer place a ship' do
    @comp_board.place(@submarine, ["C1", "C2"])
    expect(@game.comp_place("submarine")).to eq(["C1", "C2"])
  end


end
