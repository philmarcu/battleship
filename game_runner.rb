#runs game manager
require_relative 'ship'
require_relative 'cell'
require_relative 'board'
require_relative 'game_manager'
require 'pry'

game = Game_Manager.new

game

binding.pry
