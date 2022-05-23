class Game_Manager
attr_reader :board

  def initialize
    welcome_message
    @board = Board.new
  end

  def welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Entere q to quit."
    input = gets.chomp

    if input == "p"
      run_game
    elsif input == "q"
      puts "Now exiting game"
      self.initialize
    else
      puts "Invalid entry, please use p or q"
    end
  end

  def comp_place
#     rand_choice = Random.new
#     rand_choice.rand(1..2) #chooses 1 or 2
# #### ----
#     if rand_choice == 1 #horizontal
#       @board.cells.key.sample
#     elsif rand_choice == 2 #vertical
#
#     end
  ## FOR SUBMARINE
  ##3 horizontal options per line, 3*4 = 12 horizontal options
  ## 3 vertical options per line, 3*4 = 12 vertical options

  


  end

  def run_game
 #might need to load in new boards
  end
end
