#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

def print_board(arr)
  puts "#{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts '..|...|..'
  puts "#{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts '..|...|..'
  puts "#{arr[6]} | #{arr[7]} | #{arr[8]}"
end

def checks_input
  var = gets.chomp
  while !yield(var)
    puts "Please enter a valid option"
    print 'Input value here: '
    var = gets.chomp
  end
  var
end

# Game begins
puts "Welcome to tic-tac-toe game..."
puts "Please choose one of the following options : Select 1 to start a new game, Select 2 to Quit"
print 'Input value here: '
option = checks_input{|option| (option == "1" || option =="2")}

symbol_arr = ['X','O','!','?','$']

#Start New Game
if option.to_i == 1
  
  #player input
  puts 'Please enter the name of player one'
  print 'Input value here: '
  name = checks_input{|name| name != ""}
  
  puts "Please enter your choice symbol: #{symbol_arr}"
  print 'Input value here: '
  symbol = checks_input{|symbol| symbol_arr.include?(symbol)}

  symbol_arr.delete(symbol)

  player_one = Player.new(name,symbol)

  puts 'Please enter the name of player two'
  print 'Input value here: '
  name = checks_input{|name| name != ""}

  puts "Please enter your choice symbol: #{symbol_arr}"
  print 'Input value here: '
  symbol = checks_input{|symbol| symbol_arr.include?(symbol)}

  player_two = Player.new(name,symbol)
  
  #start Game
  game = Game.new(player_one, player_two)
  
  until game.finished?

    # Players turn instruction
    puts '------------------------'
    puts "#{game.current_player.name} It is your turn."
    puts '------------------------'
    print_board(game.available_moves)
    puts '------------------------'
    available_moves = game.available_moves.select { |el| (el.is_a? Numeric) }
    puts "#{game.current_player.name} Please input your move. Type the number from these moves available: #{available_moves}"
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

  #View end result either if it is a draw or a win by the current player
  puts '----------GAME ENDED--------------'
  print_board(game.available_moves)
  puts '----------FINAL RESULT--------------'
  game.winner ? (puts "#{game.winner.name} is the winner!"): (puts "It is a tie")
  
else
   
  puts "Thanks for playing Bye!"
end
