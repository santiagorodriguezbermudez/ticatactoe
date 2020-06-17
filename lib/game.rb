class Game
  attr_reader :player_one, :player_two, :available_moves
  attr_accessor :current_player, :winner
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @available_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winner = nil
  end

  def finished?
    return false until winner || available_moves.none?(Numeric)
    true
  end

  def update(current_player_selected_move)
    available_moves[current_player_selected_move.to_i - 1] = player_one.symbol if current_player == player_one
    available_moves[current_player_selected_move.to_i - 1] = player_two.symbol if current_player == player_two
    self.current_player = current_player === player_one ? player_two : player_one
    evaluate_result
  end

  protected

  # Returns the winner or if its a Tie
  def evaluate_result
    # check rows

    i = 0
    3.times do
      self.winner = player_two if available_moves[i] === player_two.symbol && (available_moves[i + 1] === player_two.symbol && available_moves[i + 2] === player_two.symbol)
      self.winner = player_one if available_moves[i] === player_one.symbol && (available_moves[i + 1] === player_one.symbol && available_moves[i + 2] === player_one.symbol)
      i += 3
    end
    # check columns
    i = 0
    3.times do
      self.winner = player_one if available_moves[i] === player_one.symbol && (available_moves[i + 3] === player_one.symbol && available_moves[i + 6] === player_one.symbol)
      self.winner = player_two if available_moves[i] === player_two.symbol && (available_moves[i + 3] === player_two.symbol && available_moves[i + 6] === player_two.symbol)
      i += 1
    end
    # check diagonals
    self.winner = player_one if available_moves[0] === player_one.symbol && (available_moves[4] === player_one.symbol && available_moves[8] === player_one.symbol)
    self.winner = player_two if available_moves[0] === player_two.symbol && (available_moves[4] === player_two.symbol && available_moves[8] === player_one.symbol)
    self.winner = player_two if available_moves[2] === player_two.symbol && (available_moves[4] === player_two.symbol && available_moves[6] === player_two.symbol)
  end
end
