class Board
  attr_reader :cells, :ships, :fired_upon

  def initialize
    @cells = {
      'A1' => Cell.new('A1'),
      'A2' => Cell.new('A2'),
      'A3' => Cell.new('A3'),
      'A4' => Cell.new('A4'),
      'B1' => Cell.new('B1'),
      'B2' => Cell.new('B2'),
      'B3' => Cell.new('B3'),
      'B4' => Cell.new('B4'),
      'C1' => Cell.new('C1'),
      'C2' => Cell.new('C2'),
      'C3' => Cell.new('C3'),
      'C4' => Cell.new('C4'),
      'D1' => Cell.new('D1'),
      'D2' => Cell.new('D2'),
      'D3' => Cell.new('D3'),
      'D4' => Cell.new('D4')
    }
    @ships = []
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    (coordinates.size == ship.length) &&
      linear?(coordinates.sort) &&
      not_overlapping?(coordinates)
  end

  def not_overlapping?(coordinates)
    result = coordinates.map do |coordinate|
      @cells[coordinate].empty?
    end
    result.all? == true
  end

  def linear?(coordinates)
    # if 2 coords
    if coordinates.count == 2
      adjacent?(coordinates[0], coordinates[1])
      # if 3 coords
    else
      (
        adjacent?(
          coordinates[0],
          coordinates[1]
        ) && adjacent?(
          coordinates[1],
          coordinates[2]
        )
        # finally check if they are in same row or same column
      ) && (same_row?(coordinates) || same_column?(coordinates))
    end
  end
  #*cells doesnt know how many to accept
  def adjacent?(cell_1, cell_2)
    row_adjacent?(cell_1, cell_2) ^ column_adjacent?(cell_1, cell_2)
  end

  def row_adjacent?(cell_1, cell_2)
    (cell_1[1].to_i - cell_2[1].to_i).abs == 1
  end

  def column_adjacent?(cell_1, cell_2)
    (cell_1[0].ord - cell_2[0].ord).abs == 1
  end

  def same_row?(coordinate)
    if coordinate.length == 2
      # A1(A) == A2(A)
      coordinate[0][0] == coordinate[1][0]
    else
      # A1(A) == A2(2) && A2(A) == A3(A)
      (coordinate[0][0] == coordinate[1][0]) && (coordinate[1][0] == coordinate[2][0])
    end
  end

  def same_column?(coordinate)
    if coordinate.length == 2
      coordinate[0][1] == coordinate[1][1]
    else
      (coordinate[0][1] == coordinate[1][1]) && (coordinate[1][1] == coordinate[2][1])
    end
  end

  def place(ship, coordinate)
    @cells.keys.select do |key|
      coordinate.each do |coord|
        # require "pry"; binding.pry
        @cells[key].place_ship(ship) if coord == key
      end
    end
  end

  def render(show = false)
    rendered = '  1 2 3 4 '

    rendered += @cells.each_value.map do |cell|
      cell.render(show)
    end.join(' ')
    rendered.insert(10, "\nA ")
    rendered.insert(21, "\nB ")
    rendered.insert(32, "\nC ")
    rendered.insert(43, "\nD ")
    rendered += " \n"
  end

  def fire_upon(coordinate)
    @cells[coordinate].fire_upon
  end
end
