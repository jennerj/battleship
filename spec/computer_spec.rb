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



end
