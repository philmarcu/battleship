require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_manager'


RSpec.describe Ship do
  before :each do
    @game = Game_Manager.new
    # @board = Board.new
    # @comp_board = Board.new
    # @player_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@game).to be_a(Game_Manager)
    expect(@game.board).to be_a(Board)
  end

  it 'starts game and initilizes comp board' do
    expect(@game.comp_board.render).to eq(" 1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
  end


  it 'players can place' do
    @game.player_board.place(@cruiser,["A1", "B1", "C1"])
    @game.player_board.place(@submarine, ["D1", "D2"])
    expect(@game.player_board.render(true)).to eq(" 1 2 3 4\nA S . . .\nB S . . .\nC S . . .\nD S S . .\n")
  end


end
