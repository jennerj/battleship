class Player

  attr_reader :cruiser,
              :submarine,
              :player_board,
              :ship_array

  def initialize
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
    @player_board = Board.new
    @player_ships = []
  end
end
