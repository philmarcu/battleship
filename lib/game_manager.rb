require './lib/board'
class Game_Manager

  attr_reader :comp_board,
              :player_board,
              :comp_cruiser,
              :comp_submarine,
              :play_cruiser,
              :play_submarine,
              :comp_ships,
              :play_ships,
              :turn
  def initialize
    @comp_board = Board.new
    @player_board = Board.new
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
    @play_cruiser = Ship.new("Cruiser", 3)
    @play_submarine = Ship.new("Submarine", 2)
    @comp_ships = [@comp_cruiser, @comp_submarine]
    @play_ships = [@comp_cruiser, @comp_submarine]
    @turn = Turn.new(@comp_board, @player_board)
  end

  def welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp
    if input == "p"
      return "p"
    elsif input == "q"
      puts "Now exiting game"
      return "q"
    else
      puts "Invalid entry, please use p or q"
      input = gets.chomp
    end
  end

  def setup 
    starting_board #initializes computer board + places
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."

    print @player_board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    cru_placement_input = STDIN.gets.chomp.upcase.split #if valid placement
    if @player_board.valid_placement?(@play_cruiser, cru_placement_input)
      @player_board.place(@play_cruiser, cru_placement_input)
     print @player_board.render(true)
   else #if not valid placement THIS LOOP RUNS FOREVER
      validity = false
      while validity != true
        puts "Those are invalid coordinates. Please try again:"
        cru_placement_input = STDIN.gets.chomp.upcase.split
        validity = @player_board.valid_placement?(@play_cruiser, cru_placement_input)
      end
      @player_board.place(@play_cruiser, cru_placement_input)
      print @player_board.render(true)
    end

    puts "Enter the squares for the Submarine (2 spaces):"
    sub_placement_input = STDIN.gets.chomp.upcase.split
    if @player_board.valid_placement?(@play_submarine, sub_placement_input)
      @player_board.place(@play_submarine, sub_placement_input)
      print @player_board.render(true)
    else
      validity = false
      while validity != true
        puts "Those are invalid coordinates. Please try again:"
        sub_placement_input = STDIN.gets.chomp.upcase.split
        validity = @player_board.valid_placement?(@play_submarine, sub_placement_input)
      end
      @player_board.place(@play_submarine, sub_placement_input)
      print @player_board.render(true)
    end
  end

  def starting_board(reveal = false)
    comp_sub_coords = comp_place(@comp_submarine.name)
    comp_cru_coords = comp_place(@comp_cruiser.name)
    @comp_board.place(@comp_submarine, comp_sub_coords)
    @comp_board.place(@comp_cruiser, comp_cru_coords)
    puts "I have laid out my ships on the grid."
  end

  def comp_place(ship)
    rand_choice = Random.new

    h_sub_1 = ["A1", "A2"]
    h_sub_2 = ["A2", "A3"]
    h_sub_3 = ["A3", "A4"]
    h_sub_4 = ["B1", "B2"]
    h_sub_5 = ["B2", "B3"]
    h_sub_6 = ["B3", "B4"]
    h_sub_7 = ["C1", "C2"]
    h_sub_8 = ["C2", "C3"]
    h_sub_9 = ["C3", "C4"]
    h_sub_10 = ["D1", "D2"]
    h_sub_11 = ["D2", "D3"]
    h_sub_12 = ["D3", "D4"]

    v_sub_1 = ["A1", "B1"]
    v_sub_2 = ["B1", "C1"]
    v_sub_3 = ["C1", "D1"]
    v_sub_4 = ["A2", "B2"]
    v_sub_5 = ["B2", "C2"]
    v_sub_6 = ["C2", "D2"]
    v_sub_7 = ["A3", "B3"]
    v_sub_8 = ["B3", "C3"]
    v_sub_9 = ["C3", "D3"]
    v_sub_10 = ["A4", "B4"]
    v_sub_11 = ["B4", "C4"]
    v_sub_12 = ["C4", "D4"]

    h_cru_1 = ["A1", "A2", "A3"]
    h_cru_2 = ["A2", "A3", "A4"]
    h_cru_3 = ["B1", "B2", "B3"]
    h_cru_4 = ["B2", "B3", "B4"]
    h_cru_5 = ["C1", "C2", "C3"]
    h_cru_6 = ["C2", "C3", "C4"]
    h_cru_7 = ["D1", "D2", "D3"]
    h_cru_8 = ["D2", "D3", "D4"]

    v_cru_1 = ["A1", "B1", "C1"]
    v_cru_2 = ["B1", "C1", "D1"]
    v_cru_3 = ["A2", "B2", "C2"]
    v_cru_4 = ["B2", "C2", "D2"]
    v_cru_5 = ["A3", "B3", "C3"]
    v_cru_6 = ["B3", "C3", "D3"]
    v_cru_7 = ["A4", "B4", "C4"]
    v_cru_8 = ["B4", "C4", "D4"]


    horizontal_sub = [h_sub_1, h_sub_2, h_sub_3, h_sub_4, h_sub_5, h_sub_6, h_sub_7, h_sub_8, h_sub_9, h_sub_10, h_sub_11, h_sub_12]
    vertical_sub = [v_sub_1, v_sub_2, v_sub_3, v_sub_4, v_sub_5, v_sub_6, v_sub_7, v_sub_8, v_sub_9, v_sub_10, v_sub_11, v_sub_12]
    horizontal_cru = [h_cru_1, h_cru_2, h_cru_3, h_cru_4, h_cru_5, h_cru_6, h_cru_7, h_cru_8]
    vertical_cru = [v_cru_1, v_cru_2, v_cru_3, v_cru_4, v_cru_5, v_cru_6, v_cru_7, v_cru_8]
    final_comp_coord = []

    if ship == "Submarine"
      choice = rand_choice.rand(1..2)
      if choice == 1
        final_comp_coord << horizontal_sub.sample
      elsif choice == 2
        final_comp_coord << vertical_sub.sample
      end

    elsif ship == "Cruiser"
      choice = rand_choice.rand(1..2)
      if choice == 1
        final_comp_coord << horizontal_cru.sample
      elsif choice == 2
        final_comp_coord << vertical_cru.sample
      end
    end
    final_comp_coord.flatten
  end

  def end_game
    if @play_ships[0].sunk? == true && @play_ships[1].sunk? == true
      puts "Aww the Computer Wins!"
      exit(true)
    elsif @comp_ships[0].sunk? && @comp_ships[1].sunk?
      puts "Yay You Win!"
      exit(true)
    end
  end

  def turn
    _exit = false

    while !_exit
      _exit = @turn.board_output
    end

    _exit
  end
end
