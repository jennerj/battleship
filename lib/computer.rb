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


end
