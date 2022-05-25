#runs game manager
require_relative 'lib/ship'
require_relative 'lib/cell'
require_relative 'lib/board'
require_relative 'lib/game_manager'
require_relative 'lib/turn'
require 'pry'



def start
  # Initialize a new game manager
  game = Game_Manager.new

#if welcome_message/main menu == p (returns p), trigger play loop
  # #welcome_message shoudl return 'p' or 'q'
  if game.welcome_message == "p"

    game.setup

    game_over = game.turn

    while !game_over
      game_over = game.turn
    end

    #while turn.board_output == false #turn method must return T or F
      #loops turns/board_output
  else
    game.welcome_message
  end

end

start
# binding.pry
