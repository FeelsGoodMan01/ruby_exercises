class Game
  def initialize
    @creator, @guesser = nil
    puts "Welcome to mastermind! Type 1 to be creator of the secret code or 2 to be the guesser"
    player = gets.chomp.to_i
    if player == 1
      @creator = Player.new
    else @guesser = Player.new
    end
    puts "Who are you going to play against? Type 1 to play with a friend or 2 vs computer"
    player = gets.chomp.to_i
    if player == 1
      @creator ? @guesser = Player.new : @creator = Player.new    
    else
      @creator ? @guesser = Computer.new : @creator = Computer.new
    end
  end
  def play
    @creator.make_code
    6.times do
      if self.check(@guesser.guess)
        puts "You guessed it!"
        return
      end
    end
    puts "You did not guessed it!"
    puts "The code was #{@creator.code.join}"
  end
  def check(guess)
    right_pos = 0
    right_num = 0
    if guess == @creator.code
      return true
    else
      guess.each_index do |index|
        if @creator.code.find_index(guess[index])
          @creator.code.find_index(guess[index]) == index ? right_pos += 1 : right_num += 1
        end
      end
    end
    puts "You got #{right_pos} numbers with right numbers and their position"
    puts "You got #{right_num} numbers right with wrong position"
    return false
  end
end

class Player
  attr_reader :code
  def initialize
    @code = ""
  end
  def make_code
    puts "Creator, type 4 numbers from 1 to 6 without spaces"
    @code = gets.chomp.split("")
    10.times do
      puts "\n \n \n \n \n \n \n \n \n \n\ \n"
    end
    puts "Code is hidden"
  end
  def guess
    puts "Guesser, type 4 numbers from 1 to 6 without spaces that you think are the code"
    return gets.chomp.split("")
  end
end

class Computer < Player
  def make_code
    6.times do
      @code << rand(1..4).to_s
    end
    @code = @code.split("")
  end
end

game = Game.new
game.play


