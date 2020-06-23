require './lib/game'
require './lib/player'
require './lib/board'

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

    it 'Neither player wins and the result is a Tie' do
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

    describe '#update' do
      it 'Update will apply the player symbols on the board according to the position given' do
        new_game.update(4)
        expect(new_game.available_moves[3]).to eql(player_one.symbol)
      end
    end

    describe '#finished?' do
      it 'Finished? will return false if the game has not finished' do
        new_game.update(1)
        new_game.update(2)
        new_game.update(3)
        new_game.update(4)
        new_game.update(5)
        expect(new_game.finished?).to eql(false)
      end

      it 'Finished? will return true if the has ended with a winner or a tie' do
        new_game.update(7)
        new_game.update(3)
        new_game.update(8)
        new_game.update(4)
        new_game.update(9)
        expect(new_game.finished?).to eql(true)
      end
    end
  end
end

describe Board do
  let(:new_board) { Board.new }

  describe '#print_board' do
    it 'Print board will return the board as a string with the values applied according to the parameter given' do
      expect(new_board.print_board(['X', 'O', 3, 4, 5, 6, 7, 8, 9])).to eql("    X | O | 3\n    ..|...|..
    4 | 5 | 6\n    ..|...|..
    7 | 8 | 9")
    end
  end
end
