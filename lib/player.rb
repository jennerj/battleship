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

  def player_setup_message
    <<~PRMT
      My ships are placed on the grid!
      Now it's your turn to lay out your two ships.
      The Cruiser is three units long and the Submarine is two units long.
      LETSKITTTTITT!!!
          1 2 3 4
        A . . . .
        B . . . .
        C . . . .
        D . . . .
    PRMT
  end

  def all_ships_sunk?
    player_ships.all? do |ship|
      ship.sunk?
    end
  end
end
