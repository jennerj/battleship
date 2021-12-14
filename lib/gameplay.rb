class Gameplay
  attr_reader :computer, :player

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def start
    puts greeting
    puts play_prompt
    user_input = gets.chomp

    if user_input == 'p'
      puts 'Yo ho ho, All hands on deck!'
      computer.computer_setup
      player.player_setup
      turn
    elsif user_input == 'q'
      exit
    else
      puts 'Error: invalid input. Please enter p to play or q to quit.'
      start
    end
  end

  def greeting
    'Greetings land lovers! Today you are at sea and must help protect your country!
    Welcome to BATTLESHIP'
  end

  def play_prompt
    'Enter p to play. Enter q to quit.'
  end

  def turn
    until game_over?
      computer.computer_board.fire_upon(player_shot)
      # avoid violating law of demeter
      return_fire(player.player_board)
      display_game_state
    end

    end_game
  end

  def valid_shot?(shot); end

  def game_over?
    player.all_ships_sunk? || computer.all_ships_sunk?
  end

  def player_shot
    valid_shot = false

    puts 'Enter the coordinate for your shot:'
    until valid_shot
      user_input = gets.chomp
      if valid_shot?(user_input)
        valid_shot = true
      elsif repeat_shot?(user_input)
        puts 'You have already fired on that coordinate. TRY AGAIN:'
      else
        puts 'Please enter a valid coordinate:'
      end
    end
  end

  def return_fire(board)
    shot = board.cells.keys.sample

    shot = board.cells.keys.sample while board.cells[shot].fired_upon?

    board.fire_upon(shot)
  end

  def display_game_state
    computer.display_board
    player.display_board
  end
end
