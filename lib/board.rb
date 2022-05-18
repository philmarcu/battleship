class Board

  attr_reader :cells
  def initialize
    @cells = {
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4")
          }
  end

  def valid_coordinate?(coord) #coord = given coordinate
    @cells.any? {|cell| cell.include?(coord)}
  end

  # def is_consecutive?(coord_array) #made this extra method so valid placement doesn't get too clustered?
  #   #meant to test the edge cases to make sure it is not diagonal
  #
  # end

  def valid_placement?(ship_type, coord_array) #coord_array being the array of requested board placement
    i = 0
    fail = false #one way to test before proceeding
    while i < coord_array.length() #will be 2 or 3 depending on ship
      if @cells.valid_coordinate?(coord_array[i]) #checks if each cell requested for placement is a valid coordinate, if so then continue (true) - maybe I need to split array with an iterator to send in individually? perhaps with size determined by ship length before the if?
        fail = false #just wanted to return something, a bit redundant
      else #else, if it is NOT a valid coordinate
        fail = true  #then it did fail
      end #end of if/else
      i += 1 #iterating to check each spot requested

    end #(end of while - not sure why white/throwing errors?)

   if !fail  #if it does not fail
     if is_consecutive?(coord_array) #checks edge cases if it is consecutive
       return true
     end #end of if

   else
     return fail

   end #end of if/else

  end #end of def

end #end of class
