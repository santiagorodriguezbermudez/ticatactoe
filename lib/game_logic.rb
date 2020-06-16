class GameLogic

  attr_reader :player_one, :player_two, :result
  attr_accessor :current_player, :available_moves

  def initialize (player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @available_moves = [1,2,3,4,5,6,7,8,9]
    @result = nil
  end

  def finished?
    return false until self.result
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
  
  
  
  
  end

end
