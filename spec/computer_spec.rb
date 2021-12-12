require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/computer'

RSpec.describe Computer do
  before(:each) do
    @computer = Computer.new
    @board = Board.new
  end

  it 'exists' do
    expect(@computer).to be_a(Computer)
  end

  it 'can have ships' do
    expect(@computer.cruiser).to be_a(Ship)
    expect(@computer.submarine).to be_a(Ship)
  end

  it 'can generate a random letter' do
    @computer.letter_gen
    expect(@computer.letter_gen).to be_a(String)
  end

  it 'can generate a random number' do
    @computer.number_gen
    expect(@computer.number_gen).to be_a(String)
  end

  it 'can generate and random number and letter into a string' do
    expect(@computer.combined_string.length).to eq(2)
    expect(@computer.combined_string).to be_a(String)
  end

  it 'checks to see if the validity of a combined string is true' do
    combined_string = "B3"
    expect(@computer.computer_board.valid_coordinate?(combined_string)).to eq(true)
  end

  it 'checks to see if the validity of a combined string is false' do
    combined_string = "G6"
    expect(@computer.computer_board.valid_coordinate?(combined_string)).to eq(false)
  end

  it 'can successfully place a submarine' do
    @computer.place_submarine
    expect(@computer.computer_board.cells.empty?).to eq(false)
  end

end
