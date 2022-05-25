#runs game manager
require_relative 'lib/ship'
require_relative 'lib/cell'
require_relative 'lib/board'
require_relative 'lib/game_manager'
require_relative 'lib/turn'
require 'pry'

game = Game_Manager.new
@cruiser = Ship.new("Cruiser", 3)
@submarine = Ship.new("Submarine", 2)

game.welcome_message


# binding.pry
