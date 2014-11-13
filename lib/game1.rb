require_relative 'codemaker'  # => true, false
require_relative 'evaluator'  # => true, false
require_relative 'messages'   # => true, false
require_relative 'validator'  # => false, true


class GameOne
  attr_reader :messages, :codemaker, :user_input, :validator  # => nil, nil

  def initialize
    @turns = 0        # was @guesses and []
    @turns_left = 17  # didn't exist
    @codemaker = Codemaker.new  # => #<Codemaker:0x007fd4fa9a9850 @colors=["r", "g", "b", "y"], @code=["r", "g", "g", "g"]>, #<Codemaker:0x007fd4fa9a3900 @colors=["r", "g", "b", "y"], @code=["b", "y", "y", "g"]>
    @start_time = ''            # => "", ""
    @end_time = ''              # => "", ""
    @messages = Messages.new    # => #<Messages:0x007fd4fa9a90a8>, #<Messages:0x007fd4fa9a34c8>
    @time = Time.new            # => 2014-11-12 23:50:29 -0700, 2014-11-12 23:50:29 -0700
  end

  def display_instructions
    puts messages.game_instructions
  end

  def quit
    puts messages.abrupt_end
    abort
  end

  # def check_length
  #   if @user_input.length < 4
  #     puts messages.not_enough_guesses
  #   elsif @user_input.length > 4
  #     puts messages.too_many_guesses
  #   end
  # end

  def play
    p "Secret code: #{codemaker.code}"  #shows the code. for testing.
    puts messages.game_flow_blurb                                   # => nil, nil
    puts messages.prompt_for_answer                                 # => nil, nil
  ##_________________ALTERNATIVE___________##
    until (user_input == "q")                                       # => false, false
      @user_input = gets.chomp.downcase                             # ~> NoMethodError: undefined method `chomp' for nil:NilClass
      quit if user_input == 'q'
      @evaluator = Evaluator.new(user_input.chars, codemaker.code)
      @turns += 1
      @turns_left -= 1
        check_length
        if colors    = @evaluator.correct_colors
           positions = @evaluator.correct_positions
           puts end_game_sequence
           puts prompt_at_end
        elsif
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
        if
          puts valid_length
        end
    end
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

  def start_time
    Time.now
  end

  def total_time
    @end_time - @start_time
  end

  def end_time
     @end_time = Time.now
  end

  def prompt_at_end
    puts "Do you want to (p)lay again or (q)uit like a wuss?"
    print "<$>"
  end

end
g = GameOne.new.play

# >> "Secret code: [\"r\", \"g\", \"g\", \"g\"]"
# >> I have generated a beginner sequence with four elements made up of:
# >>     (r)ed,(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
# >> What's your guess?
# >> <$>
# >> "Secret code: [\"b\", \"y\", \"y\", \"g\"]"
# >> I have generated a beginner sequence with four elements made up of:
# >>     (r)ed,(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
# >> What's your guess?
# >> <$>

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> /Users/edmac/Turing/Mastermind/lib/game1.rb:43:in `play'
# ~> /Users/edmac/Turing/Mastermind/lib/game1.rb:104:in `<main>'
