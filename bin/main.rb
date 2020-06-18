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

def recurring_input
  variable = gets.chomp
  until yield(variable)
    print 'Invalid option. Please input again: '
    variable = gets.chomp
  end
  variable
end

# Game begins
puts 'Welcome to tic-tac-toe game...'
symbol_arr = ['X', 'O', '!', '?', '$']

# player input
# Creates player one
player_name('player one')
name = recurring_input { |variable| variable != '' }
player_symbol(symbol_arr)
symbol = recurring_input { |variable| symbol_arr.include?(variable.upcase) }
symbol_arr.delete(symbol.upcase)
player_one = Player.new(name, symbol)

# Creates player two
player_name('player two')
name = recurring_input { |variable| variable != '' }
player_symbol(symbol_arr)
symbol = recurring_input { |variable| symbol_arr.include?(variable.upcase) }
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
