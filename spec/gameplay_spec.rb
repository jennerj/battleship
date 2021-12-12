require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'

RSpec.describe Gameplay do
  before(:each) do
    @gameplay = Gameplay.new
  end

  it 'exists' do
    expect(@gameplay).to be_a(Gameplay)
  end

end
