require_relative 'codemaker'  # => true
require_relative 'evaluator'  # => true
require_relative 'messages'   # => true


class Game
  attr_reader :messages, :codemaker, :user_input  # => nil

  def initialize
    @codemaker = Codemaker.new
    @start_time = ''
    @end_time = ''
    @messages = Messages.new
    @time = Time.new
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
  #  p "Secret code: #{codemaker.code}"
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
      puts "You have #{positions} correct position."
    else
      puts "#{positions} positions are correct."
    end
  end

  def arbiter_of_turns
    check_length
    check_proper_colors
  end

  def check_proper_colors
    unless colors > 1
      puts "You have #{colors} color that's correct."
    else
      puts "#{colors} colors are correct"
    end

    unless positions > 1
      puts "You have #{positions} correct position."
    else
      puts "#{positions} positions are correct."
    end
  end

  def win?
    user_input == codemaker.code
  end

  def loser_message
    puts "\nOut of guesses! You lose! (p)lay again or (q)uit?"
    puts "Total time played: #{total_time}"
  end

  def end_game_sequence
    "\nCongrats! You guessed the secret code: #{@codemaker.code} in"
    #{}"#{total_time} seconds."
  end

  def prompt_at_end
    puts "Do you want to (p)lay again or (q)uit like always?"
    print "<$>"
  end
end

# g = Game.new.play
