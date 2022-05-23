class Game_Manager
  attr_reader :board

  def initialize
    welcome_message
    @board = Board.new
  end

  def welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp
    if input == "p"
    elsif input == "q"
      puts "Now exiting game"
    else
      puts "Invalid entry, please use p or q"
    end
  end

  def comp_place(ship, coord)
  end

  def user_place(ship, coord)
  end
end
