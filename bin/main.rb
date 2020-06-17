#!/usr/bin/env ruby

def print_board(arr)
  puts "#{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts '..|...|..'
  puts "#{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts '..|...|..'
  puts "#{arr[6]} | #{arr[7]} | #{arr[8]}"
end

require_relative '../lib/player.rb'
require_relative '../lib/validations.rb'
require_relative '../lib/game_logic.rb'
include MyValidations


# Game begins
puts "Welcome to tic-tac-toe game..."
puts "Please choose one of the following options : Select 1 to start a new game, Select 2 to Quit"
option = checks_input{|option| (option == "1" || "2")}

#Start New Game
if option.to_i == 1
  
  #player input
  puts"Please enter the name of player one"
  player_one = Player.new()
  
  puts"Please enter the name of player two"
  player_two = Player.new()
  
  #start Game
  game = GameLogic.new(player_one, player_two)
  
  until game.finished?
    
    player_current = game.current_player
    board = game.available_moves

    # Players turn instruction
    puts '------------------------'
    puts "#{player_current.name} It is your turn."
    puts '------------------------'
    print_board(board)
    puts '------------------------'
    available_moves = board.select { |el| (el.is_a? Numeric) }
    puts "#{player_current.name} Please input your move. Type the number from these moves available: #{available_moves}"
    
    current_player_selected_move = gets.chomp.to_i
    
    until available_moves.include?(current_player_selected_move.to_i)
      puts '------------------------'
      puts "INVALID MOVE: Please provide a valid move. You have these moves available: #{available_moves}"
      current_player_selected_move = gets.chomp
    end

    # Update board
    board[current_player_selected_move.to_i - 1] = 'x' if player_current == player_one
    board[current_player_selected_move.to_i - 1] = 'o' if player_current == player_two

    game.update(board)

  end

  #View end result either if it is a draw or a win by the current player
  puts '----------GAME ENDED--------------'
  print_board(game.available_moves)
  puts '----------FINAL RESULT--------------'
  game.winner ? (puts "#{game.winner.name} is the winner!"): (puts "It is a tie")
  
else 
  puts "Thanks for playing Bye!!"
end
