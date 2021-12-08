require './lib/board'
require './lib/cell'
require './lib/ship'


RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end

  it 'has a full board of cells' do
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.length).to eq(16)
  end

  



end
