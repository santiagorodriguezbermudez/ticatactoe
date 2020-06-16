class GameLogic

  attr_reader :player_one, :player_two
  attr_accessor :current_player, :available_moves

  def initialize (player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @available_moves = [1,2,3,4,5,6,7,8,9]
  end

  def finished?
    if self.result?
      true
    else 
      false
    end
  end

  def result?
    
  
  end


  def valid_move?(move)
    available_moves.include?(move)
  end

  def current_board
    puts "Example of how the borad will look like"
  end

  def update(current_move)
    if self.current_player == self.player_one
      self.current_player = self.player_two
    else
      self.current_player = self.player_one
    end
  end

  def result 
    "#{self.player_one} Is the winner!!!"
  end

  def update_board(player, move)
    if player == self.player_one
      self.available_moves[move-1] = "x"
    else
      self.available_moves[move-1] = "o"
    end
    self.available_moves
  end


end
