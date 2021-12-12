class Computer
  attr_reader :cruiser,
              :submarine,
              :computer_board

  def initialize
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
    @computer_board = Board.new
  end

  #create letter variable equal to ["A", "B", "C", "D"] and then taking
  #a random sample of the letter array
  def letter_gen
    letter = ("A".."D").to_a
    letter.sample
  end

  def number_gen
    number = ("1".."4").to_a
    number.sample
  end

  def combined_string
    number_gen + letter_gen
  end

  def place_submarine
    submarine_coordinates = []
    until submarine_coordinates.length == @submarine.length do
      submarine_coordinates << combined_string
    end
    submarine_coordinates.sort
    if @computer_board.valid_placement?(@submarine, submarine_coordinates) == true
      @computer_board.place(@submarine, submarine_coordinates)
    end
  end

  def place_cruiser
    cruiser_coorinates = []
    until cruiser_coorinates.length == @cruiser.length do
      cruiser_coorinates << combined_string
    end
    cruiser_coorinates.sort
    if @computer_board.valid_placement?(@cruiser, cruiser_coorinates) == true
      @computer_board.place(@cruiser, cruiser_coorinates)
    end
  end

end
