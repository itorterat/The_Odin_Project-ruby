# frozen_string_literal: true

class Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end
end

class Board
  BOARD_INDEXES_RANGE = (0..8).freeze
  BOARD_VALUES_RANGE = (1..9).freeze

  attr_reader :board

  def initialize
    @board = BOARD_VALUES_RANGE.to_a
  end

  def display_board
    system('clear')
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '---+---+---'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '---+---+---'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def update_board(position, mark)
    board[position] = mark
  end
end

class Game
  MIN_TURNS_TO_WIN = 5
  MAX_TURNS = 9
  WIN_LINES = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  private_constant :MIN_TURNS_TO_WIN, :MAX_TURNS, :WIN_LINES

  def initialize
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @nb_turn = 1
  end

  def new_game
    game = Game.new
    game.play
  end

  def play
    board.display_board
    MAX_TURNS.times do
      current_player = switch_player.mark
      ask_placement(current_player)
      board.display_board
      if win?(current_player)
        puts "\nPlayer #{current_player} WINS!"
        break rematch?
      end
    end

    puts "\nIt's a draw."
    rematch?
  end

  private

  attr_reader :board, :player1, :player2
  attr_accessor :nb_turn

  def ask_placement(current_player)
    puts "\nPlayer #{current_player}, choose a position (1-9):"
    input = gets.chomp.to_i - 1

    if valid_move?(input)
      board.update_board(input, current_player)
      self.nb_turn += 1
    else
      puts "\nInvalid input. Please choose an empty cell (1-9)."
      ask_placement(current_player)
    end
  end

  def valid_move?(input)
    Board::BOARD_INDEXES_RANGE.include?(input) && Board::BOARD_VALUES_RANGE.include?(board.board[input])
  end

  def win?(current_player)
    return if nb_turn <= MIN_TURNS_TO_WIN

    WIN_LINES.any? do |line|
      line.all? { |index| board.board[index] == current_player }
    end
  end

  def switch_player
    nb_turn.odd? ? player1 : player2
  end

  def rematch?
    puts "\nWould you like to rematch?(Y/n)"
    answer = gets.chomp.downcase
    %w[y yes].include?(answer) ? new_game : exit
  end
end

Game.new.new_game
