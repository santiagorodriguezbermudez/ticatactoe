#!/usr/bin/env ruby


# Game begins
puts "Welcome to tic-tac-toe game..."
puts "Please choose one of the following options: Select 1 to start a new game, Select 2 to quit"
option = gets.chomp

#Start New Game
if option.to_i == 1
  
  #player input
  puts"Please enter the name of player one"
  player_one = gets.chomp
  
  puts"Please enter the name of player two"
  player_two = gets.chomp
  
  #start Game
  puts "The game has begin"
  game_not_finished = true
  
  while game_not_finished
    
    player_current = player_one
    available_moves = [1,2,3,4,5,6,7,8,9]

    #Players turn instruction
    puts "#{player_current} It is your turn."
    puts "Please input your move. You have these moves available: #{available_moves}"
    current_player_selected_move = gets.chomp
    game_invalid_move = true

    while game_invalid_move
      puts "Please provide a valid move. You have these moves available: #{available_moves}"
      current_player_selected_move = gets.chomp
      game_invalid_move = false
    end

    puts "This is the current state of the Board: "
    
    game_not_finished = false

  end

  #View end result either if it is a draw or a win by the current player
  puts "#{player_one} has won"

else 
  puts "Thanks for playing Bye!!"
end
