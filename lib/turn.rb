require_relative 'board'
require_relative 'game_manager'

class Turn
attr_reader :comp_board, :player_board

  def initialize(comp_board, player_board)
    @comp_board = comp_board
    @player_board = player_board
    # @player_shot = ""
    # @comp_shot = ""
    @player_ship_sunk = 0
    @cpu_ship_sunk = 0
  end

  def board_output
    puts "=============COMPUTER BOARD============="
    print @comp_board.render

    puts "==============PLAYER BOARD=============="
    print @player_board.render(true)

    puts "Enter the coordinate for your shot:"
    given_coord = STDIN.gets.chomp.upcase

    player_shot(given_coord)
    comp_choice = self.comp_shot
    # cpu_feedback(comp_choice)
    # player_feedback(given_coord)

    #return T or F if game over
    if cpu_feedback(comp_choice) == true || player_feedback(given_coord) == true
      return true
    end
  end


  def player_shot(given_coord)
    target_cell = cell_finder(given_coord)
    if @comp_board.valid_coordinate?(given_coord)
      target_cell.fire_upon
    else
      valid = false
      while !valid do
        puts "Please enter a valid coordinate:"
        given_coord = gets.chomp
        if @comp_board.valid_coordinate?(given_coord)
          valid = true
          target_cell = cell_finder(given_coord)
          target_cell.fire_upon
        end
      end
    end
    valid
  end

  # def player_cell_finder(given_coord)
  #   located_cell = []
  #   @player_board.cells.each do |cell|
  #     if cell.last.coordinate == given_coord
  #       located_cell << cell
  #     end
  #   end
  #   located_cell.flatten[1]
  # end

  def cell_finder(comp_choice)
    @comp_board.cells[comp_choice]
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
    valid
    final_choice
  end

  def player_feedback(player_shot)
    curr_cell = @comp_board.cells[player_shot]
    play_status = ""
    all_sunk = false

    # require 'pry' ; binding.pry

    if curr_cell.fired_upon? && !curr_cell.empty?
      play_status = "hit"
    elsif curr_cell.fired_upon? == false && curr_cell.empty? == true
      play_status = "miss"
    # elsif curr_cell.ship.sunk?
    #   @player_ship_sunk += 1
    end

    if all_sunk == false
      puts "Your shot on #{curr_cell.coordinate} was a #{play_status}"

      if curr_cell.ship != nil
        if curr_cell.ship.sunk?
          @player_ship_sunk += 1
          puts "My #{curr_cell.ship.name} has been sunk"
        end
      end


      if @player_ship_sunk == 2
        all_sunk = true
        puts "Game Over!"
      end
    end
    all_sunk
  end

  def cpu_feedback(comp_shot)

    cpu_status = ""

    all_sunk = false

    if comp_shot.fired_upon? && !comp_shot.empty?
      cpu_status = "hit"
    elsif comp_shot.fired_upon? && comp_shot.empty?
      cpu_status = "miss"
    elsif comp_shot.ship.health == 0
      @cpu_ship_sunk += 1
    end

    if all_sunk == false
      puts "My shot on #{comp_shot.coordinate} was a #{cpu_status}"
    if comp_shot.ship != nil
      if !comp_shot.empty? && comp_shot.ship.health == 0
        @cpu_ship_sunk += 1
        puts "Your #{comp_shot.ship.name} has been sunk"
      end
    end

      if @cpu_ship_sunk == 2
        all_sunk = true
        puts "Game Over!"
      end
    end
    all_sunk
  end
end
