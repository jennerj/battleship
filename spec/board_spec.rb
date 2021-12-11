require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end

  it 'has a full board of cells' do
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.length).to eq(16)
  end

  it 'validates coordinate' do
    expect(@board.valid_coordinate?('A1')).to eq(true)
    expect(@board.valid_coordinate?('D4')).to eq(true)
    expect(@board.valid_coordinate?('A5')).to eq(false)
    expect(@board.valid_coordinate?('E1')).to eq(false)
    expect(@board.valid_coordinate?('A22')).to eq(false)
  end

  it 'checks if the length is valid' do
    expect(@board.valid_placement?(@cruiser, %w[A1 A2])).to be(false)
    expect(@board.valid_placement?(@submarine, %w[A2 A3 A4])).to be(false)
  end

  it 'checks if the coordinates are consecutive' do
    expect(@board.valid_placement?(@cruiser, %w[A1 A2 A3])).to eq(true)
    expect(@board.valid_placement?(@submarine, %w[A1 C1])).to eq(false)
    expect(@board.valid_placement?(@cruiser, %w[A3 A2 A1])).to eq(true)
    expect(@board.valid_placement?(@submarine, %w[C1 C2])).to eq(true)
  end

  it 'checks if the coordinates are not diagonal' do
    expect(@board.valid_placement?(@cruiser, %w[A1 B2 C3])).to eq(false)
    expect(@board.valid_placement?(@submarine, %w[C2 D3])).to eq(false)
  end

  it 'checks if the placement of the ship is valid' do
    expect(@board.valid_placement?(@cruiser, %w[A1 A2 A3])).to eq(true)
    expect(@board.valid_placement?(@submarine, %w[A1 C1])).to eq(false)
    expect(@board.valid_placement?(@cruiser, %w[D4 C4 B4])).to eq(true)
    expect(@board.valid_placement?(@submarine, %w[D1 B1])).to eq(false)
  end

  it 'checks is two cells are adjacent in a row' do
    expect(@board.row_adjacent?('A3', 'A4')).to be(true)
    expect(@board.row_adjacent?('B1', 'B2')).to be(true)
  end

  it 'checks is two cells are adjacent in a column' do
    expect(@board.column_adjacent?('A3', 'B3')).to be(true)
    expect(@board.column_adjacent?('C1', 'D1')).to be(true)
  end

  it 'checks to make sure two adjacent cells are not diagonal' do
    expect(@board.valid_placement?(@submarine, %w[C2 D3])).to be(false)
    expect(@board.valid_placement?(@cruiser, %w[A1 B2 C3])).to be(false)
  end

  it 'checks validity of placement after all the previous tests' do
    expect(@board.valid_placement?(@submarine, %w[A1 A2])).to be(true)
    expect(@board.valid_placement?(@cruiser, %w[B1 C1 D1])).to be(true)
  end

  it 'places ships on the board' do
    cell_1 = @board.cells['A1']
    cell_2 = @board.cells['A2']
    cell_3 = @board.cells['A3']
    @board.place(@cruiser, %w[A1 A2 A3])
    expect(cell_1.ship).to eq(@cruiser)
    expect(cell_2.ship).to eq(@cruiser)
    expect(cell_3.ship).to eq(@cruiser)
    expect(cell_1.ship).to eq(cell_2.ship)
    expect(cell_2.ship).to eq(cell_3.ship)
    expect(cell_3.ship).to eq(cell_2.ship)
  end

  it 'checks if ships overlap' do
    @board.place(@cruiser, %w[A1 A2 A3])
    expect(@board.valid_placement?(@submarine, %w[A1 B1])).to be false
  end

  it 'invalid coordinate with overlapping ships' do
    @board.place(@cruiser, %w[A1 A2 A3])
    expect(@board.not_overlapping?(%w[A1 B1])).to be false
  end

  it 'checks to see overlapping' do
    @board.place(@cruiser, %w[A1 A2 A3])
    expect(@board.not_overlapping?(%w[C1 B1])).to be true
  end

  it 'returns a visual of the game board' do
    expect(@board.render).to eq(
      "  1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
    )
  end

  it 'shows where the ship is on the board' do
    @board.place(@cruiser, %w[A1 A2 A3])

    expect(@board.render(true)).to eq(
      "  1 2 3 4 \n" +
      "A S S S . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
    )
  end
end
