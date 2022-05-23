class Game_Manager
  attr_reader :board #might attr_reader horizontal + vertical arrays in initialize

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

  # def comp_initialize
  #   #will define each option for bot here to use in comp_place
  # end

  def comp_place(ship)
    rand_choice = Random.new #1 == horizontal, 2 == vertical

    h_sub_1 =
    h_sub_2 =
    h_sub_3 =
    h_sub_4 =
    h_sub_5 =
    h_sub_6 =
    h_sub_7 =
    h_sub_8 =
    h_sub_9 =
    h_sub_10 =
    h_sub_11 =
    h_sub_12 =

    v_sub_1 =
    v_sub_2 =
    v_sub_3 =
    v_sub_4 =
    v_sub_5 =
    v_sub_6 =
    v_sub_7 =
    v_sub_8 =
    v_sub_9 =
    v_sub_10 =
    v_sub_11 =
    v_sub_12 =

    h_cru_1 =
    h_cru_2 =
    h_cru_3 =
    h_cru_4 =
    h_cru_5 =
    h_cru_6 =
    h_cru_7 =
    h_cru_8 =

    v_cru_1 =
    v_cru_2 =
    v_cru_3 =
    v_cru_4 =
    v_cru_5 =
    v_cru_6 =
    v_cru_7 =
    v_cru_8 =


    horizontal_sub = [h_sub_1, h_sub_2, h_sub_3, h_sub_4, h_sub_5, h_sub_6, h_sub_7, h_sub_8, h_sub_9, h_sub_10, h_sub_11, h_sub_12]
    vertical_sub = [v_sub_1, v_sub_2, v_sub_3, v_sub_4, v_sub_5, v_sub_6, v_sub_7, v_sub_8, v_sub_9, v_sub_10, v_sub_11, v_sub_12]

    horizontal_cru = [h_cru_1, h_cru_2, h_cru_3, h_cru_4, h_cru_5, h_cru_6, h_cru_7, h_cru_8]
    vertical_cru = [v_cru_1, v_cru_2, v_cru_3, v_cru_4, v_cru_5, v_cru_6, v_cru_7, v_cru_8]

    final_comp_coord = []

    if ship == "submarine"
      rand_choice.rand(1..2)
      if rand_choice == 1
        choice = horizontal_sub.sample
        final_comp_coord = choice
      elsif rand_choice == 2
        choice = vertical_sub.sample
        final_comp_coord = choice
      end

    elsif ship == "cruiser"
      rand_choice.rand(1..2)
      if rand_choice == 1
        choice = horizontal_cru.sample
        final_comp_coord = choice
      elsif rand_choice == 2
        choice = vertical_cru.sample 
        final_comp_coord = choice
      end
    end
    return final_comp_coord
  end

  def user_place(ship, coord)
  end
end
