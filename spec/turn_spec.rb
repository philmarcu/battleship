require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
# require './lib/game_manager'

RSpec.describe Turn do
  before :each do

    @comp_board = Board.new
    @player_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @turn = Turn.new(@comp_board, @player_board)
  end

  it 'exists' do
    expect(@turn).to be_a(Turn)
  end

  xit 'can render the comp_board' do
    expect(@turn.comp_board.render).to eq(" 1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
  end

  it 'comp_shots' do
    expect(@turn.comp_choice).to be_a(Cell)
  end

  xit 'player can make a shot' do

  end

  it "returns feedback" do
    player_input = Cell.new("A4")
    comp_input = Cell.new("C1")
    allow(@turn.feedback(player_input, comp_input)).to receive(player_input).and_return("A4")
  end
end
