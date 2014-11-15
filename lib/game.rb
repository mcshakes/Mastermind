require_relative 'codemaker'
require_relative 'evaluator'
require_relative 'messages'
require 'colorize'
require_relative 'timer'


class Game
  attr_reader :messages, :codemaker, :user_input, :start_time, :timer

  def initialize
    @codemaker = Codemaker.new
    @messages = Messages.new
    @start_time = Time.new
    @timer = Timer.new
  end

  def display_instructions
    puts messages.game_instructions
  end

  def quit
    puts messages.abrupt_end
    abort
  end

  def check_length
    if @user_input.length < 4
      puts messages.not_enough_guesses
    elsif @user_input.length > 4
      puts messages.too_many_guesses
    end
  end

  def play
    p "Secret code: #{codemaker.code}"
    puts messages.game_flow_blurb
    puts messages.prompt_for_answer
    until win?
      @user_input = gets.chomp.downcase
      quit if user_input == 'q'
      @evaluator = Evaluator.new(user_input.chars, codemaker.code)
      correct_colors
      correct_positions
      check_length
    end
    puts end_game_sequence
    puts prompt_at_end
  end

  def correct_colors
    colors    = @evaluator.correct_colors
    unless colors > 1
      puts "You have #{colors} color that's correct."
    else
      puts "#{colors} colors are correct"
    end
  end

  def correct_positions
    positions = @evaluator.correct_positions
    unless positions > 1
      puts "You have #{positions} correct position.".yellow
    else
      puts "#{positions} positions are correct.".yellow
    end
  end

  def check_proper_colors
    unless colors > 1
      puts "You have #{colors} color that's correct.".yellow
    else
      puts "#{colors} colors are correct".yellow
    end

    unless positions > 1
      puts "You have #{positions} correct position.".yellow
    else
      puts "#{positions} positions are correct.".yellow
    end
  end

  def win?
    user_input == codemaker.code.join
  end
  #
  # def end_time
  #   Time.now
  # end
  #
  # def minutes
  #   timer / 60
  # end
  #
  # def seconds
  #   timer % 60
  # end
  #
  # def timer
  #   (end_time - @start_time).to_i
  # end

  def loser_message
    puts "\nOut of guesses! You lose! (p)lay again or (q)uit?"
    puts "Total time played: #{total_time}"
  end

  def end_game_sequence
    "\nCongrats! You guessed the secret code: #{@codemaker.code} at #{@timer.minutes} minutes and #{@timer.seconds} seconds."
  end

  def prompt_at_end
    puts "\nDo you want to (p)lay again, read those (i)nstructions again, \nor (q)uit like always?"
    print "<$>"
  end
end

# g = Game.new.play
