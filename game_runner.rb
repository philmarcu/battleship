require_relative 'lib/ship'
require_relative 'lib/cell'
require_relative 'lib/board'
require_relative 'lib/game_manager'
require_relative 'lib/turn'
require 'pry'



def start
  game = Game_Manager.new
  if game.welcome_message == "p"

    game.setup

    game_over = game.turn

    while !game_over
      game_over = game.turn
    end
  else
    game.welcome_message
  end

end

start
