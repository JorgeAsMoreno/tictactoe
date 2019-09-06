module TicTacToe
  class Board
    attr_accessor :board_dimensions, :total_dimensions

    def initialize(board_dimensions, total_dimensions)
      @board_dimensions = board_dimensions
      @total_dimensions = total_dimensions
    end

    def self.printboard(board_dimensions, print_dimensions)
        row = 0
        while row < board_dimensions
            ((board_dimensions * row)...((row + 1) * board_dimensions)).each { |index| print "|#{print_dimensions[index]}|" }
            print "\n"
            row += 1
        end
    end

    def horizontal_combination(player)
    (1..@board_dimensions).each do |row|
        horizontal = 0
        ((@board_dimensions * (row - 1))..((@board_dimensions * row) - 1)).each do |section|
          horizontal += 1 if @total_dimensions[section] == player
        end
        return true if horizontal == @board_dimensions
      end
    end

    def vertical_combination(player)
      (0..((@board_dimensions * 1) - 1)).each do |section|
        vertical = 0
        dm_v = 0
        @board_dimensions.times do
          vertical += 1 if @total_dimensions[section + dm_v] == player
          dm_v += @board_dimensions
        end
        return true if vertical == @board_dimensions
      end
    end

    def diagonal_combination(player)
      (1..@board_dimensions).each do |row|
        ((@board_dimensions * (row - 1))..((@board_dimensions * row) - 1)).each do |section|
          diagonal = 0
          dm_d = 0
          @board_dimensions.times do
            diagonal += 1 if @total_dimensions[section + dm_d] == player
            dm_d += @board_dimensions + 1
          end
          return true if diagonal == @board_dimensions
        end
      end
    end

    def inv_diagonal_combination(player)
      inverted_diagonal = 0
      (1..@board_dimensions).each do |row|
        inverted_diagonal += 1 if @total_dimensions[(@board_dimensions - 1) * row] == player
        return true if inverted_diagonal == @board_dimensions
      end
    end
  end 
end
