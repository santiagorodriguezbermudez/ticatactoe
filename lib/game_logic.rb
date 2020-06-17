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

  def update(board,current_player_selected_move)
    board[current_player_selected_move.to_i - 1] = self.player_one.symbol if self.player_current == self.player_one
    board[current_player_selected_move.to_i - 1] = self.player_two.symbol if self.player_current == self.player_two
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
      self.winner = self.player_two if (board[i] == self.player_two.symbol && (board[i+1] == self.player_two.symbol && board[i+2] == self.player_two.symbol ))
      self.winner = self.player_one if (board[i] == self.player_one.symbol && (board[i+1] == self.player_one.symbol && board[i+2] == self.player_one.symbol))
      i +=3
    end
    #check columns
    i=0 
    3.times do 
      self.winner = self.player_one if (board[i] == self.player_one.symbol && (board[i+3] == self.player_one.symbol && board[i+6] == self.player_one.symbol))
      self.winner = self.player_two if (board[i] == self.player_two.symbol && (board[i+3] == self.player_two.symbol && board[i+6] == self.player_two.symbol))
      i +=1
    end
    #check diagonals
    self.winner = self.player_one if (board[0] == self.player_one.symbol && (board[4] == self.player_one.symbol && board[8] == self.player_one.symbol))
    self.winner = self.player_two if (board[0] == self.player_two.symbol && (board[4] == self.player_two.symbolo && board[8] == self.player_two.symbol))
    self.winner = self.player_one if (board[2] == self.player_one.symbol && (board[4] == self.player_one.symbol && board[6] == self.player_one.symbol))
    self.winner = self.player_two if (board[2] == self.player_two.symbol && (board[4] == self.player_two.symbol && board[6] == self.player_two.symbol))
    
  end
end