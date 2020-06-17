#!/usr/bin/env ruby

def print_board(arr)
  puts "#{arr[0]} | #{arr[1]} | #{arr[2]}"
  puts '..|...|..'
  puts "#{arr[3]} | #{arr[4]} | #{arr[5]}"
  puts '..|...|..'
  puts "#{arr[6]} | #{arr[7]} | #{arr[8]}"
end

def evaluate_game
  true
end

def update_player(player)
  player
end

# Game begins
puts 'Welcome to tic-tac-toe game...'
puts 'Please choose one of the following options: Select 1 to start a new game, Select 2 to quit'
option = gets.chomp

# Start New Game
if option.to_i == 1

  # player input
  puts 'Please enter the name of player one'
  player_one = gets.chomp

  puts 'Please enter the name of player two'
  player_two = gets.chomp

  # start Game
  puts 'The game has begin'
  game_not_finished = true

  # Game variables
  player_current = player_one
  board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  while game_not_finished

    # Players turn instruction
    puts '------------------------'
    puts "#{player_current} It is your turn."
    print_board(board)

    available_moves = board.select { |el| (el.is_a? Numeric) }

    puts "Please input your move. You have these moves available: #{available_moves}"
    current_player_selected_move = gets.chomp

    until available_moves.include?(current_player_selected_move.to_i)
      puts "Please provide a valid move. You have these moves available: #{available_moves}"
      current_player_selected_move = gets.chomp
    end

    # Update board
    board[current_player_selected_move.to_i - 1] = 'x' if player_current == player_one
    board[current_player_selected_move.to_i - 1] = 'o' if player_current == player_two

    # Change current player
    current_player = update_player(current_player)

    # NOT IMPLEMENTED YET -> Evaluates the result of the game after the turn has ended
    game_not_finished = evaluate_game
    puts "#{player_one} has won" unless game_not_finished

  end

else
  puts 'Thanks for playing Bye!!'
end
