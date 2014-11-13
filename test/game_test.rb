gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_there_is_a_game
    game = Game.new
    assert game
  end

  def test_instructions_are_displayed
    skip
    game = Game.new
    assert_equal "\nPick amongst four colors: \n(r)ed \n(g)reen \n(b)lue and \n(y)ellow.
    Only those four. Complicated right?
    You can (q)uit any time, quitter. Nobody judges you."

  end

  def test_a_game_can_generate_a_code
    code = %w(r g b y)
    game = Game.new
    code = Codemaker.new
    assert_equal 4, code.length
  end

  def test_user_inputs_in_arrays

  end

  def test_user_gets_feedback_if_wins

  end

  def test_user_gets_feedback_if_loses

  end

  def test_time_is_displayed_always

  end






end
