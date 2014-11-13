require 'colorize'  # => true

class Messages

  def welcome_message
    clear_screen
    puts '
  ___  ___             _                           _             _
  |  \/  |            | |                         (_)           | |
  | .  . |  __ _  ___ | |_   ___  _ __  _ __ ___   _  _ __    __| |
  | |\/| | / _` |/ __|| __| / _ \| "__|| "_ ` _ \ | || "_ \  / _` |
  | |  | || (_| |\__ \| |_ |  __/| |   | | | | | || || | | || (_| |
  \_|  |_/ \__,_||___/ \__| \___||_|   |_| |_| |_||_||_| |_| \__,_|'

   "\n\nWelcome to MASTERMIND!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit? <$>"
  end

  def game_instructions
    "\nPick amongst four colors: \n(r)ed \n(g)reen \n(b)lue and \n(y)ellow.
    Only those four. Complicated right?
    You can (q)uit any time, quitter. Nobody judges you."
  end

  def game_flow_blurb
    "I have generated a sequence with four elements made up of:
    (r)ed,(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.".magenta
  end

  def prompt_for_answer
    "\nGive me your guess! \n<$>"   #has to appear after every wrong guess
  end

  def abrupt_end
    "\nCan't hack it? \nMaster your mind before it masters you."
  end

  def turns_left
    "That was turn number: \n"
    "Number of turns left:"
  end

  def not_enough_guesses
    "\nToo short. Pound that keyboard and add some guesses".red
  end

  def too_many_guesses
    "\nToo long bro. Stop jamming random keys.".red
  end

  def invalid_commands
    "Those are your only choices genius"
    "Nope! Don't recognize that command"
    "Your choices are (p)lay, read complicated (i)nstructions, or (q)uit."
    "Pick one please."
    print "<$>"
  end

  def end_game_sequence
    "Congrats! You guessed the secret code: . "
  end

  def clear_screen
    print "\e[2J\e[f"
  end


end
