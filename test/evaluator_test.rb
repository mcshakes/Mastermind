gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/evaluator'

class EvaluatorTest < Minitest::Test

  def test_player_guess_no_matches
    guess = %w(r g y y)
    code = ["b","b","b","b"]
    evaluator = Evaluator.new(guess, code)
    assert_equal 0, evaluator.correct_colors
  end

  def test_player_guess_match_one_color_and_one_position
    guess = ["r","g","y","y"]
    code =  ["r","b","b","b"]
    evaluator = Evaluator.new(guess, code)
    assert_equal 1, evaluator.correct_colors
    assert_equal 1, evaluator.correct_positions
  end

  def test_player_guess_match_two_colors_and_one_position
    guess = ["r","g","y","y"]
    code =  ["r","b","g","b"]
    evaluator = Evaluator.new(guess, code)
    assert_equal 2, evaluator.correct_colors
    assert_equal 1, evaluator.correct_positions
  end

  def test_player_guess_match_three_colors_and_one_position
    guess = ["r","g","y","y"]
    code  = ["r","b","g","g"]
    evaluator = Evaluator.new(guess, code)
    assert_equal 3, evaluator.correct_colors
    assert_equal 1, evaluator.correct_positions
  end

  def test_player_guess_matches_secret_colors
    guess = ["r","g","b","y"]
    code  = ["r","g","b","y"]
    evaluator = Evaluator.new(guess, code)
    assert guess == code
  end
end
