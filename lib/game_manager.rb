class Game_Manager

  def initialize
    # welcome_message
    @board = Board.new
  end

  def welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Entere q to quit."
    input = gets.chomp

    if input == "p"
    elsif input == "q"
      puts "Now exiting game"
    else
      puts "Invalid entry, please use p or q"
    end
  end

  def comp_place
    require "pry"; binding.pry
    # limit computers' choices by making a valid_placement array of coordinates
    # valid_arrays = []
    
    #@board.cells.each do |coord|

    #might need to load in new boards
    # Computer Board should be rendered as false

    # User board should be rendered as true

    # Computer must place their ships (randomly: use .sample)
    # Computer can possibly choose out of an array of the cell keys
    # if computer chooses one of the coords, the other 1-2 choices must also follow
    # in line (thru valid_placement?) with the 1st choice.
    # Then we need another ranomizer method - variable = Random.new
    # variable.rand(2)
  end

  def user_place
  end
end
