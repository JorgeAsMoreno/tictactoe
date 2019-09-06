# frozen_string_literal: true

require './tictactoe/version'
require './tictactoe/board'
require './tictactoe/player'
require './tictactoe/game'
require './tictactoe/verify'

player_one = 'X'
player_two = 'O'
play_again = ' '
while play_again == ' ' || play_again == 'Y'
  play_again = ' '
  game = TicTacToe::Game.new(0, 'none', player_one, player_two)
  player_one = game.play_game
  player_two = if player_one == 'O'
                 'X'
               else
                 'O'
            end
  play_again = TicTacToe::Game.try_again(play_again)
end
