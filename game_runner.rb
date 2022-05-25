#runs game manager
require_relative 'lib/ship'
require_relative 'lib/cell'
require_relative 'lib/board'
require_relative 'lib/game_manager'
require_relative 'lib/turn'
require 'pry'



def start
  game = Game_Manager.new
#if welcome_message/main menu == p (returns p), trigger play loop
  if game.welcome_message == "p"
    game.setup
    while game.turn_loop == false
      game.turn_loop
    end

    #while turn.board_output == false #turn method must return T or F
      #loops turns/board_output
  else
    game.welcome_message
  end

end

start
# binding.pry
