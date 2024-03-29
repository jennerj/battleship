require './lib/ship'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new('Cruiser', 3)
  end

  it 'exists' do
    expect(@cruiser).to be_an_instance_of(Ship)
  end

  it 'has a name' do
    expect(@cruiser.name).to eq('Cruiser')
  end

  it 'has length' do
    expect(@cruiser.length).to eq(3)
  end

  it 'has health' do
    expect(@cruiser.health).to eq(3)
  end

  it 'is not sunk by default' do
    expect(@cruiser.sunk?).to be false
  end

  it 'gets hit and loses a health' do
    expect(@cruiser.health).to eq(3)
    @cruiser.hit
    expect(@cruiser.health).to eq(2)
  end

  it 'gets sunk when health is at zero' do
    expect(@cruiser.health).to eq(3)
    @cruiser.hit
    expect(@cruiser.health).to eq(2)
    @cruiser.hit
    expect(@cruiser.health).to eq(1)
    @cruiser.hit
    expect(@cruiser.health).to eq(0)
    expect(@cruiser.sunk?).to be true
  end
end
