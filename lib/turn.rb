require_relative 'board'

class Turn
attr_reader :comp_board, :player_board, :player_shot, :comp_random_shot, :given_coord, :comp_choice

  def initialize(comp_board, player_board)
    @comp_board = comp_board
    @player_board = player_board
    @player_shot = ""
    @comp_choice = ""
  end

  def board_output
    puts "=============COMPUTER BOARD============="
    print @comp_board.render(true)

    puts "==============PLAYER BOARD=============="
    print @player_board.render(true)

    puts "Enter the coordinate for your shot:"
    @given_coord = STDIN.gets.chomp
    player_shot(@given_coord)
    @comp_choice = comp_shot
    feedback(@given_coord, @comp_choice)
  end


  def player_shot(given_coord)
    target_cell = cell_finder(given_coord)
    # require 'pry' ; binding.pry
    if @comp_board.valid_coordinate?(@given_coord)
      target_cell.fire_upon
    else
      valid = false
      while !valid
        puts "Please enter a valid coordinate:"
        @given_coord = gets.chomp
        if @comp_board.valid_coordinate?(@given_coord)
          valid = true
          target_cell = cell_finder(@given_coord)
          target_cell.fire_upon
        end
      end
    end
  end

  def cell_finder(given_coord)
    located_cell = []
    @comp_board.cells.each do |cell|
      if cell.last.coordinate == given_coord
        located_cell << cell
      end
    end
    located_cell.flatten[1]
    # require 'pry' ; binding.pry
  end

  def comp_shot
    final_choice = ""
    @comp_random_shot = @player_board.cells.values.find_all{|cell| cell}

    test_choice = @comp_random_shot.sample

    valid = false
    while !valid
      if test_choice.fired_upon? == false
        test_choice.fire_upon
        valid = true
        final_choice = test_choice
      elsif test_choice.fired_upon? == true
        test_choice = @comp_random_shot.sample
        valid = false
      end
    end

    final_choice
  end

  def feedback(player_shot, comp_choice)

    curr_cell = cell_finder(player_shot)
    status = ""
    sunk = false
    if curr_cell.fired_upon? && !curr_cell.empty?
      status = "hit"
    elsif curr_cell.fired_upon? && curr_cell.empty?
      status = "miss"
    elsif curr_cell.ship.sunk?
      require "pry"; binding.pry
      sunk = true
    end

    ship_sunk = 0
    if sunk == false
      puts "Your shot on #{curr_cell.coordinate} was a #{status}"
      if curr_cell.ship.sunk?
        ship_sunk += 1
        puts "Your #{curr_cell.ship.name} has been sunk"
        board_output
      elsif ship_sunk == 2
        sunk = true
        puts "Game Over!"
      else
        board_output
      end
    end
    sunk
  end
end
