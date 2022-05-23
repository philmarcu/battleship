require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_manager'


RSpec.describe Ship do
  game = Game_Manager.new
  board = Board.new
  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)

  it 'exists' do
    expect(game).to be_a(Game_Manager)
    expect(board).to be_a(Board)
  end

  xit 'can send a welcome message' do
    allow(game.welcome_message).to receive(:gets).and_return('p', 'q')
    msg = double(msg)
    expect(game.welcome_message).to eq(msg)
  end

  it 'randomly places comp ship' do
    board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(game.comp_place(@submarine).count).to eq(2)
    expect(game.comp_place(@cruiser).count).to eq(3)
  end
end
