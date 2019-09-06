def verification(moves, board, player)
  v = false
  while v == false
    if board[moves.to_i] == ' '
      return moves
    elsif player == 1
      print "\nTurn of the player ONE: "
      moves = gets.chomp
    elsif player == 2
      print "\nTurn of the player TWO: "
      moves = gets.chomp
    end
  end
end

def insert_dimensions
  dimensions = 0
  while dimensions < 3
    print 'Choose the size of the board: '
    dimensions = gets.chomp.to_i
    puts "\n"
    dimensions = 0 if dimensions < 3
  end
  dimensions
end
