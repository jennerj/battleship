require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'

RSpec.describe Computer do
  before(:each) do
    @computer = Computer.new
    # @ship = Ship.new
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

end
