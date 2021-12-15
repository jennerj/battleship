class Computer
  attr_reader :cruiser,
  :submarine,
  :computer_board,
  :computer_ships

  def initialize
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
    @computer_board = Board.new
    @computer_ships = [@cruiser, @submarine]
  end

  def computer_setup
    place_cruiser
    place_submarine
  end

  # create letter variable equal to ["A", "B", "C", "D"] and then taking
  # a random sample of the letter array
  def letter_gen
    letter = ('A'..'D').to_a
    letter.sample
  end

  def number_gen
    number = ('1'..'4').to_a
    number.sample
  end

  def random_coordinate
    string_cell = letter_gen + number_gen
    cell = @computer_board.cells.select do |key, cell|
      key == string_cell
    end
    if !cell[string_cell].empty?
      random_coordinate
    end
    cell
  end

  def place_submarine
    submarine_coordinates = [random_coordinate.keys, random_coordinate.keys].flatten
    until @computer_board.valid_placement?(@submarine, submarine_coordinates) do
      submarine_coordinates = [random_coordinate.keys, random_coordinate.keys].flatten
    end
    @computer_board.place(@submarine, submarine_coordinates)
  end

  def place_cruiser
    cruiser_coordinates = [random_coordinate.keys, random_coordinate.keys, random_coordinate.keys].flatten
    until @computer_board.valid_placement?(@cruiser, cruiser_coordinates) do
      cruiser_coordinates = [random_coordinate.keys, random_coordinate.keys, random_coordinate.keys].flatten
    end
    @computer_board.place(@cruiser, cruiser_coordinates)
  end

  def all_ships_sunk?
    computer_ships.all? do |ship|
      ship.sunk? == true
    end
  end

  def display_board
    puts '=============COMPUTER BOARD============='
    puts computer_board.render
  end

  def clear_board!
    @computer_board = Board.new
  end
end
