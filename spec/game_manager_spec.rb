require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_manager'


RSpec.describe Ship do
  game = Game_Manager.new
  board = Board.new

  it 'exists' do
    expect(game).to be_a(Game_Manager)
    expect(board).to be_a(Board)
  end

  it 'can send a welcome message' do
    allow($sdtin).to receive(:gets).and_return('p')
    valid
    expect(game.welcome_message).to eq(input)
  end
end
