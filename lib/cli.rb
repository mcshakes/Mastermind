require_relative 'messages'
require_relative 'game'

class CLI
  attr_reader :messages, :user_input, :output, :input

  def initialize(input, output)
    @messages = Messages.new
    @input = input
    @output = output
    @user_input = ""
  end

  def calls
    output.puts messages.welcome_message
    until finished?
      @user_input = input.gets.strip.downcase
      start_menu_processes
    end
    output.puts messages.end_game_sequence
  end

  def start_menu_processes
    case
    when play?
      Game.new.play
    when instructions?
      output.puts messages.game_instructions
    when finished?
      output.puts messages.abrupt_end
      abort
    else
      output.puts messages.invalid_commands
    end
  end

  def play?
    user_input == "p"
  end

  def instructions?
    user_input == "i"
  end

  def finished?
    user_input == "q"
  end
end
