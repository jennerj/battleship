class Gameplay
  attr_reader :computer, :player, :fire_upon

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
        player_shot = gets.chomp
        if valid_shot?(player_shot)
          valid_shot = true
        elsif repeat_shot?(player_shot)
          puts 'You have already fired on that coordinate. TRY AGAIN:'
        else
          puts 'Please enter a valid coordinate:'
        end
      end

      computer.computer_board.fire_upon(player_shot)

      shot = player.player_board.cells.keys.sample
      shot = player.player_board.cells.keys.sample while player.player_board.cells[shot].fired_upon?
      player.player_board.fire_upon(shot)

      computer.display_board
      player.display_board

      (if computer.computer_board.cells[player_shot].render == 'X'
         puts "Your shot on #{player_shot} sunk my ship!"
       elsif computer.computer_board.cells[player_shot].render == 'H'
         puts "Your shot on #{player_shot} was a hit!"
       elsif computer.computer_board.cells[player_shot].render == 'M'
         puts "Your shot on #{player_shot} was a miss."
       end

       if player.player_board.cells[shot].render == 'X'
         puts "My shot on #{shot} sunk your ship!"
       elsif player.player_board.cells[shot].render == 'H'
         puts "My shot on #{shot} was a hit!"
       elsif player.player_board.cells[shot].render == 'M'
         puts "My shot on #{shot} was a miss."
       end)
    end

    end_game
  end

  def valid_shot?(player_shot)
    computer.computer_board.valid_coordinate?(player_shot) && computer.computer_board.cells[player_shot].fired_upon? == false
  end

  def game_over?
    player.all_ships_sunk? || computer.all_ships_sunk?
  end

  def repeat_shot?(player_shot)
    computer.computer_board.valid_coordinate?(player_shot) && computer.computer_board.cells[player_shot].fired_upon
  end

  def end_game
    if player.all_ships_sunk?
      puts 'I won!'
    elsif computer.all_ships_sunk?
      puts 'You won!'
    end
    clear_boards!
    start
  end

  def clear_boards!
    player.clear_board!
    computer.clear_board!
  end
end
