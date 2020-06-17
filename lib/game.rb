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
    available_moves[current_player_selected_move.to_i - 1] = current_player.symbol
    evaluate_result
    self.current_player = current_player === player_one ? player_two : player_one
  end

  protected

  # Returns the winner or if its a Tie
  def evaluate_result
    # check rows

    i = 0
    3.times do
      self.winner = current_player if available_moves[i] === current_player.symbol && (available_moves[i + 1] === current_player.symbol && available_moves[i + 2] === current_player.symbol)
      i += 3
    end
    # check columns
    i = 0
    3.times do
      self.winner = current_player if available_moves[i] === current_player.symbol && (available_moves[i + 3] === current_player.symbol && available_moves[i + 6] === current_player.symbol)
      i += 1
    end
    # check diagonals
    self.winner = current_player if available_moves[0] === current_player.symbol && (available_moves[4] === current_player.symbol && available_moves[8] === current_player.symbol)
    self.winner = current_player if available_moves[2] === current_player.symbol && (available_moves[4] === current_player.symbol && available_moves[6] === current_player.symbol)
  end
end
