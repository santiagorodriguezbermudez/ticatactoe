class Game
  attr_reader :player_one, :player_two, :available_moves, :winning_patterns_index
  attr_accessor :current_player, :winner
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @available_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winner = nil
    @winning_patterns_index = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def finished?
    return false until winner || available_moves.none?(Numeric)
    true
  end

  def update(current_player_selected_move)
    available_moves[current_player_selected_move.to_i - 1] = current_player.symbol
    evaluate_result
    self.current_player = current_player == player_one ? player_two : player_one
  end

  protected

  # Returns the winner or if its a Tie
  def evaluate_result
    winning_patterns_index.each do |pattern|
      self.winner = current_player if pattern.all? { |index| available_moves[index] == current_player.symbol }
    end
  end
end
