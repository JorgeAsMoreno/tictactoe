# frozen_string_literal: true

module TicTacToe
  class Game
    attr_accessor :movements, :winner_player
    attr_reader   :xs, :o

    def initialize(movements, winner_player, xs, o)
      @movements = movements.to_i
      @winner_player = winner_player
      board_dimensions = insert_dimensions
      @player_one = TicTacToe::Player.new(xs, 1)
      @player_two = TicTacToe::Player.new(o, 2)
      total_dimensions = Array.new((board_dimensions * board_dimensions), ' ')
      @board = TicTacToe::Board.new(board_dimensions, total_dimensions)
      total_dimensions = Array.new((board_dimensions * board_dimensions), 0)
      @moves = TicTacToe::Board.new(board_dimensions, total_dimensions)
      Board.printboard(@board.board_dimensions, @board.total_dimensions)
    end

    def play_game
      while @winner_player == 'none' && @movements < ((@board.board_dimensions * @board.board_dimensions))
        @movements = play(@player_one, @movements)
        @movements = play(@player_two, @movements) if @winner_player == 'none'
      end

      if @winner_player == @player_one.symbol || @winner_player == 'none'
        return @player_two.symbol
      elsif @winner_player == @player_two.symbol
        return @player_one.symbol
      end
    end

    def play(player, movements)
      print "\nTurn of the player ONE: " if player.number == 1
      if movements != ((@board.board_dimensions * @board.board_dimensions))
        print "\nTurn of the player TWO: " if player.number == 2
        move = gets.chomp
        move = verification(move, @board.total_dimensions, player.number)
        @board.total_dimensions[move.to_i] = player.symbol
        @moves.total_dimensions[movements.to_i] = 1
        @winner_player = win_combinations(player.symbol)
        Board.printboard(@board.board_dimensions, @board.total_dimensions)
        verify_winner
        movements += 1
        return movements
      end
      if movements == ((@board.board_dimensions * @board.board_dimensions)) && @winner_player == 'none'
        puts 'Draw'
        return movements
      end
    end

    def win_combinations(player)
      if @board.horizontal_combination(player) == true ||
         @board.vertical_combination(player) == true ||
         @board.diagonal_combination(player) == true ||
         @board.inv_diagonal_combination(player) == true
        return player
      end
      @winner_player
    end

    def verify_winner
      puts "\nPlayer X WON!\n\n" if @winner_player == @player_one.symbol
      puts "\nPlayer O WON!\n\n" if @winner_player == @player_two.symbol
    end

    def self.try_again(try_again_var)
      while try_again_var != 'Y' && try_again_var != 'N'
        print 'Play again? (Y/N)? '
        try_again_var = gets.chomp.upcase
      end
      try_again_var
    end
  end
end
