require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'is a cell' do
    expect(@cell).to be_an_instance_of(Cell)
  end

  it 'can have a coordinate' do
    expect(@cell.coordinate).to eq("B4")
  end

  it 'can have a ship' do
    expect(@cell.ship).to eq(nil)
  end

  it 'starts empty' do
    expect(@cell.empty?).to be true
  end

  it 'has a ship' do
    expect(@cruiser).to be_an_instance_of(Ship)
  end

  it '#place_ship' do
    @cell.place_ship(@cruiser)
    expect(@cell.ship).to eq(@cruiser)
    expect(@cell.empty?).to eq false
  end

end
