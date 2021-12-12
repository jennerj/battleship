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
    sub_coordinates = []
    until sub_coordinates.length == @submarine.length do
      sub_coordinates << combined_string
    end
    sub_coordinates.sort
    if @computer_board.valid_placement?(@submarine, sub_coordinates) == true
      @computer_board.place(@submarine, sub_coordinates)
    end
  end
end
