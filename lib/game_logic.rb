class GameLogic

  attr_reader :player_one, :player_two
  attr_accessor :current_player, :available_moves, :winner

  def initialize (player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @available_moves = [1,2,3,4,5,6,7,8,9]
    @winner = nil
  end

  def finished?
    return false until self.winner || (self.available_moves.none? (Numeric)) 
    true
  end

  def update(board)
    if self.current_player == self.player_one
      self.current_player = self.player_two
    else
      self.current_player = self.player_one
    end

    self.evaluate_result(board)
  end

  protected

  #Returns the winner or if its a Tie
  def evaluate_result(board)
    
    #check rows
    i=0 
    3.times do 
      self.winner = self.player_two if (board[i] == "o" && (board[i+1] == "o" && board[i+2] == "o"))
      self.winner = self.player_one if (board[i] == "x" && (board[i+1] == "x" && board[i+2] == "x"))
      i +=3
    end
    #check columns
    i=0 
    3.times do 
      self.winner = self.player_one if (board[i] == "x" && (board[i+3] == "x" && board[i+6] == "x"))
      self.winner = self.player_two if (board[i] == "o" && (board[i+3] == "o" && board[i+6] == "o"))
      i +=1
    end
    #check diagonals
    self.winner = self.player_one if (board[0] == "x" && (board[4] == "x" && board[8] == "x"))
    self.winner = self.player_two if (board[0] == "o" && (board[4] == "o" && board[8] == "o"))
    self.winner = self.player_one if (board[2] == "x" && (board[4] == "x" && board[6] == "x"))
    self.winner = self.player_two if (board[2] == "o" && (board[4] == "o" && board[6] == "o"))
    
  end
end