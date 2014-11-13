gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'


class CLITest < Minitest::Test
  def test_user_can_quit
    cli = CLI.new(nil,nil)
    cli.stub :user_input, 'q' do
    assert cli.finished?
    refute cli.play?
    refute cli.instructions?
    end
  end

  def test_user_can_play
    cli = CLI.new(nil,nil)
    cli.stub :user_input, 'p' do
    refute cli.finished?
    assert cli.play?
    refute cli.instructions?
    end
  end

  def test_user_can_view_instructions
    cli = CLI.new(nil,nil)
    cli.stub :user_input, 'i' do
    refute cli.finished?
    refute cli.play?
    assert cli.instructions?
    end
  end



end
