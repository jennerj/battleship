class Player
  attr_reader :cruiser,
              :submarine,
              :player_board,
              :ship_array,
              :player_ships

  def initialize
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
    @player_board = Board.new
    @player_ships = []
  end

  def player_setup
    puts player_setup_message
    place_ship
  end

  def player_setup_message
    <<~PRMT
      My ships are placed on the grid!
      Now it's your turn to lay out your two ships.
      The Cruiser is three units long and the Submarine is two units long.
      LETS GO!!!
          1 2 3 4
        A . . . .
        B . . . .
        C . . . .
        D . . . .
    PRMT
  end

  def place_ship
    place_cruiser
    place_submarine
  end

  def place_cruiser
    cruiser_placed = false
    until cruiser_placed
      puts 'Enter the coordinates for the Cruiser (3 spaces ex. A1 B1 C1):'
      user_placement = gets.to_s.chomp
      ship = Ship.new('Cruiser', 3)
      coordinates = user_placement.split

      if player_board.valid_placement?(ship, coordinates)
        player_board.place(ship, coordinates)
        cruiser_placed = true
        player_ships << ship
      else
        puts 'Invalid placement, try again.'
      end
    end

    puts player_board.render(true)
  end

  def place_submarine
    submarine_placed = false
    until submarine_placed
      puts 'Enter the coordinates for the Submarine (2 spaces ex. D1 D2):'
      user_placement = gets.to_s.chomp
      ship = Ship.new('Submarine', 2)
      coordinates = user_placement.split

      if player_board.valid_placement?(ship, coordinates)
        player_board.place(ship, coordinates)
        submarine_placed = true
        player_ships << ship
      else
        puts 'Invalid placement, try again.'
      end

      puts 'Set sails to victory! Your board looks like this:'
      puts ''
      puts player_board.render(true)
    end
  end

  def all_ships_sunk?
    player_ships.all? do |ship|
      ship.sunk?
    end
  end

  def clear_board!
    @player_board = Board.new
  end

  def display_board
    puts '==============PLAYER BOARD=============='
    puts player_board.render(true)
  end
end
