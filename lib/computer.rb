class Computer
  attr_reader :cruiser,
              :submarine,
              :computer_board,
              :ship_array

  def initialize
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
    @computer_board = Board.new
    @computer_ships = []
  end

end
