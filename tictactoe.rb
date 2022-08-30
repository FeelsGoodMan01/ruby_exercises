module TicTacToe
  WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
end
class Game
  include TicTacToe
  def initialize
    @board = (1..9).to_a
    @turn = 1
    @players = [nil, Player.new(self,'X'), Player.new(self,'O')]
  end
  def play
    loop do
      draw_board
      place_marker
      if player_won?
        draw_board
        puts "Player #{@turn} won! Congrats!"
        return
      end
      if board_full?
        draw_board
        puts "It's a draw!"
        return
      end
      @turn = @turn % 2 + 1
    end
  end
  def place_marker
    repeat = false
    loop do
      puts "Player #{@turn}, your turn! Type position you would like to put #{@players[@turn].marker}" unless repeat
      move = gets.chomp.to_i - 1
      if @board[move].is_a? Integer
        @board[move] = @players[@turn].marker
        return
      end
      puts "This place is occupied! Pick different one"
      repeat = true
    end
  end
  def board_full?
    @board.each do |pos|
      if pos.is_a? Integer 
        return false
      end
    end
    return true
  end
  def draw_board
    col_separator, row_separator = " | ", "--+---+--"
    @board.each_index do |index|
      case index % 3
      when 0
        print @board[index], col_separator
      when 1
        print @board[index], col_separator
      when 2
        puts @board[index], row_separator
      end
    end
  end
  def player_won?
    WINNING_LINES.any? do |line|
      line.all? {|move| @board[move] == @players[@turn].marker}
    end
  end
end

class Player
  attr_reader :marker
  def initialize(game, marker)
    @game = game
    @marker = marker
  end
end 


Game.new.play