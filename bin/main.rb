#!/usr/bin/env ruby

puts 'Hello world!'

#What do we need from each player
    # name of player for identification
    # players input
    #launch or end or play another  game

#what do you need to display for player?
  #Lauch the game
    #puts "Helo How are you?  Welcome to tictactoe Game"
    #Please choose the following options:
    #1 New game
    #2 Quit
  # if new Option 1
  #loop
  #Please enter the name of player one
  # player_one = get.chomp
  #Please enter the name of player two
  # player_two = get.chomp
  # Display the grid 
  #puts "#{player_one} please give us your input"
  # input_player_one =  get.chomp
  # Display the grid 
  #puts "#{player_two} please give us your input"
  # input_player_two =  get.chomp
require_relative '../lib/player.rb'
require_relative '../lib/validations.rb'
include MyValidations

puts "Welcome to tic-tac-toe game..."
puts "Please choose one of the following options : Select 1 to start a new game, Select 2 to Quit"
option = checks_input{|option| (option == "1" || "1")}

if option.to_i == 1
  puts"Please enter the name of player one"
  player_one = Player.new()
  
  puts"Please enter the name of player two"
  player_two = Player.new()
  
else 
  puts "Thanks for playing Bye!!"
end
