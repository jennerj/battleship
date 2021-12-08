require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new('B4')
    @cruiser = Ship.new('Cruiser', 3)
  end

  it 'is a cell' do
    expect(@cell).to be_an_instance_of(Cell)
  end

  it 'can have a coordinate' do
    expect(@cell.coordinate).to eq('B4')
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
    expect(@cell.empty?).to be false
  end

  it 'starts as fired upon' do
    @cell.place_ship(@cruiser)
    expect(@cell.fired_upon?).to be false
  end

  it 'gets fired upon' do
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to be true
  end

  it 'has a . if its unhit and empty' do
    cell = Cell.new('B4')
    expect(cell.render).to eq('.')
  end

  it 'has an M for a miss if empty' do
    cell = Cell.new('B4')
    expect(cell.render).to eq('.')
    cell.fire_upon
    expect(cell.render).to eq('M')
  end

  it 'has a . if unhit and with a ship' do
    cell = Cell.new('B4')
    cruiser = Ship.new('cruiser', 3)
    cell.place_ship(cruiser)

    expect(cell.render).to eq('.')
  end

  it 'has S if unhit with a ship and the reveal code' do
    cell = Cell.new('B4')
    cruiser = Ship.new('cruiser', 3)
    cell.place_ship(cruiser)

    expect(cell.render(true)).to eq('S')
  end

  it 'shows an H for a hit cell with a ship' do
    cell = Cell.new('B4')
    cruiser = Ship.new('cruiser', 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    expect(cell.render(true)).to eq('H')
  end
end
