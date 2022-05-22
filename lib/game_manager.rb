class Game_Manager

  def initialize
    welcome_message
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

  def run_game
 #might need to load in new boards
  end
end
