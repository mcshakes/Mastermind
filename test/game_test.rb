gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_there_is_a_game
    game = Game.new
    assert game
  end

  def test_new_game_has_no_guesses
    game = Game.new
    assert_equal 0, game.user_input.to_s.length
  end

  def test_a_game_can_generate_a_code
    code = %w(r g b y)
    assert_equal 4, code.length
  end

  #require "pry"; binding.pry

  def test_user_gets_feedback_if_wins
    game = Game.new
    game.win?
    assert game.end_game_sequence
  end

  def test_time_is_displayed_always
    game = Game.new
    assert game.timer.minutes
  end

end
