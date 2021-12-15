require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/gameplay'
require './lib/player'
require './lib/computer'

RSpec.describe Gameplay do
  before(:each) do
    @gameplay = Gameplay.new
  end

  it 'exists' do
    expect(@gameplay).to be_a(Gameplay)
  end

  it 'has a prompt to play the game' do
    expect(@gameplay.play_prompt).to eq('Enter p to play. Enter q to quit.')
  end

  it 'has a greeting for the start of the game' do
    expect(@gameplay.greeting).to eq('Greetings land lovers! Today you are at sea and must help protect your country!
    Welcome to BATTLESHIP')
  end
end
