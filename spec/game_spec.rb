require './lib/game'
require './lib/player'

describe Game do
  let(:player_one) { Player.new('Santiago', 'X') }
  let(:player_two) { Player.new('Emilio', 'O') }
  let(:new_game) { Game.new(player_one, player_two) }

  describe '#evaluate_result' do
    # Winning by Rows
    it 'Player One wins after selecting first row' do
      # Simulates players inputs
      new_game.update(1)
      new_game.update(4)
      new_game.update(2)
      new_game.update(5)
      new_game.update(3)
      expect(new_game.winner).to eql(player_one)
    end

    it 'Player One wins after selecting second row' do
      # Simulates players inputs
      new_game.update(4)
      new_game.update(3)
      new_game.update(5)
      new_game.update(7)
      new_game.update(6)
      expect(new_game.winner).to eql(player_one)
    end

    it 'Player One wins after selecting last row' do
      # Simulates players inputs
      new_game.update(7)
      new_game.update(3)
      new_game.update(8)
      new_game.update(4)
      new_game.update(9)
      expect(new_game.winner).to eql(player_one)
    end

    # Winning by Columns
    it 'Player one wins after selecting last column' do
      # Simulates players inputs
      new_game.update(3)
      new_game.update(1)
      new_game.update(6)
      new_game.update(2)
      new_game.update(9)
      expect(new_game.winner).to eql(player_one)
    end

    it 'Player two wins after selecting first column' do
      # Simulates players inputs
      new_game.update(3)
      new_game.update(1)
      new_game.update(5)
      new_game.update(4)
      new_game.update(9)
      new_game.update(7)
      expect(new_game.winner).to eql(player_two)
    end

    it 'Player two wins after selecting middle column' do
      # Simulates players inputs
      new_game.update(3)
      new_game.update(2)
      new_game.update(1)
      new_game.update(5)
      new_game.update(9)
      new_game.update(8)
      expect(new_game.winner).to eql(player_two)
    end

    it 'Player Two wins after selecting diagonal' do
      # Simulates players inputs
      new_game.update(2)
      new_game.update(1)
      new_game.update(3)
      new_game.update(5)
      new_game.update(6)
      new_game.update(9)
      expect(new_game.winner).to eql(player_two)
    end

    it 'Player one wins after selecting a diagonal' do
      (1..7).each { |el| new_game.update(el) }
      expect(new_game.winner).to eql(player_one)
    end

    it 'Neither player wins' do
      new_game.update(1)
      new_game.update(2)
      new_game.update(3)
      new_game.update(4)
      new_game.update(5)
      new_game.update(9)
      new_game.update(6)
      new_game.update(7)
      new_game.update(8)
      expect(new_game.winner).to eql(nil)
    end
  end
end
