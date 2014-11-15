require_relative 'codemaker'  # => true

class Evaluator

  attr_reader :guess, :code  # => nil

  def initialize (guess, code)
    @code = code
    @guess = guess
  end

  def correct_colors
    code_duplicate = @code.dup

    guess.each do |letter|
      if code_duplicate.include?(letter)
        code_duplicate.delete(letter)     #Can also use code.uniq
      end
    end
    4 - code_duplicate.length
  end

  def correct_positions
    counter = 0

    guess.zip(code).select do |guess_value, code_value|
      if guess_value == code_value
        counter += 1
      end
    end
    counter
  end
end
