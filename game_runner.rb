#runs game manager
require_relative 'lib/ship'
require_relative 'lib/cell'
require_relative 'lib/board'
require_relative 'lib/game_manager'
require_relative 'lib/turn'
require 'pry'



def start
  game = Game_Manager.new
  while game.welcome_message == false
    
  end
end

start
# binding.pry
