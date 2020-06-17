class Game

  attr_reader :player_one, :player_two, :available_moves
  attr_accessor :current_player, :winner

  def initialize (player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @available_moves = [1,2,3,4,5,6,7,8,9]
    @winner = nil
  end

  def finished?
    p self.available_moves
    return false until self.winner || (self.available_moves.none? (Numeric)) 
    true
  end

  def update(current_player_selected_move)

    self.available_moves[current_player_selected_move.to_i - 1] = self.player_one.symbol if self.current_player == self.player_one
    self.available_moves[current_player_selected_move.to_i - 1] = self.player_two.symbol if self.current_player == self.player_two

    if self.current_player == self.player_one
      self.current_player = self.player_two
    else
      self.current_player = self.player_one
    end
    self.evaluate_result()
  end

  protected

  #Returns the winner or if its a Tie
  def evaluate_result
    
    #check rows
    i=0 
    3.times do 
      self.winner = self.player_two if (self.available_moves[i] == self.player_two.symbol && (self.available_moves[i+1] == self.player_two.symbol && self.available_moves[i+2] == self.player_two.symbol))
      self.winner = self.player_one if (self.available_moves[i] == self.player_one.symbol && (self.available_moves[i+1] == self.player_one.symbol && self.available_moves[i+2] == self.player_one.symbol))
      i +=3
    end

    #check columns
    i=0 
    3.times do 
      self.winner = self.player_one if (self.available_moves[i] == self.player_one.symbol && (self.available_moves[i+3] == self.player_one.symbol && self.available_moves[i+6] == self.player_one.symbol))
      self.winner = self.player_two if (self.available_moves[i] == self.player_two.symbol && (self.available_moves[i+3] == self.player_two.symbol && self.available_moves[i+6] == self.player_two.symbol))
      i +=1
    end

    #check diagonals
    self.winner = self.player_one if (self.available_moves[0] == self.player_one.symbol && (self.available_moves[4] == self.player_one.symbol && self.available_moves[8] == self.player_one.symbol))
    self.winner = self.player_two if (self.available_moves[0] == self.player_two.symbol && (self.available_moves[4] == self.player_two.symbol && self.available_moves[8] == self.player_two.symbol))
    self.winner = self.player_one if (self.available_moves[2] == self.player_one.symbol && (self.available_moves[4] == self.player_one.symbol && self.available_moves[6] == self.player_one.symbol))
    self.winner = self.player_two if (self.available_moves[2] == self.player_two.symbol && (self.available_moves[4] == self.player_two.symbol && self.available_moves[6] == self.player_two.symbol))
    
  end
end