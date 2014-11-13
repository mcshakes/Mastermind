require_relative 'codemaker'
require_relative 'game'
 # should be checking user input

class Validator
  attr_reader :guess, :code

  def initialize(guess, length, valid_colors)
    self.guess = guess
    self.valid_colors =valid_colors
    @valid_length = valid_length
  end

  def valid_length
    if @user_input.length < 4
      puts messages.not_enough_guesses
    elsif @user_input.length > 4
      puts messages.too_many_guesses
    end
  end

  def valid?
    # return false unless guess.length == length
    # guess.chars. all? { |char| valid_colors.include? char }
    input = @guess.split('')
    valid = %w(r b g y)
  end
end
