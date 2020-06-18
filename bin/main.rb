#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

def player_name(player)
  puts "Please enter the name of #{player}"
  print 'Input value here: '
end

def player_symbol(symbol_arr)
  puts "Please enter your choice symbol: #{symbol_arr}"
  print 'Input value here: '
end

# Game begins
puts 'Welcome to tic-tac-toe game...'

# Start New Game
# player input
symbol_arr = ['X', 'O', '!', '?', '$']
player_name('player one')
name = checks_input { |var| var != '' }

player_symbol(symbol_arr)
symbol = checks_input { |var| symbol_arr.include?(var.upcase) }

symbol_arr.delete(symbol)

player_one = Player.new(name, symbol)

player_name('player two')
name = checks_input { |var| var != '' }

player_symbol(symbol_arr)
symbol = checks_input { |var| symbol_arr.include?(var.upcase) }

player_two = Player.new(name, symbol)

# start Game
game = Game.new(player_one, player_two)
board = Board.new

until game.finished?

  # Players turn instruction
  puts '------------------------'
  puts "#{game.current_player.name} It is your turn."
  puts '------------------------'
  puts board.print_board(game.available_moves)
  puts '------------------------'
  available_moves = game.available_moves.select { |el| (el.is_a? Numeric) }
  puts "#{game.current_player.name} Enter your move. Chose from the available moves: #{available_moves}"
  print 'Input value here: '
  current_player_selected_move = gets.chomp.to_i

  until available_moves.include?(current_player_selected_move.to_i)
    puts '------------------------'
    puts "INVALID MOVE: Please provide a valid move. You have these moves available: #{available_moves}"
    print 'Input value here: '
    current_player_selected_move = gets.chomp
  end

  # Update board
  game.update(current_player_selected_move)

end

# View end result either if it is a draw or a win by the current player
puts '----------GAME ENDED--------------'
puts board.print_board(game.available_moves)
puts '----------FINAL RESULT--------------'
game.winner ? (puts "#{game.winner.name} is the winner!") : (puts 'It is a tie')
