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

      computer.computer_board.fire_upon(user_input)

      shot = player.player_board.cells.keys.sample

      shot = player.player_board.cells.keys.sample while player.player_board.cells[shot].fired_upon?

      player.player_board.fire_upon(shot)

      computer.display_board
      player.display_board
    end

    end_game
  end

  def game_over?
    player.all_ships_sunk? || computer.all_ships_sunk?
  end
end
