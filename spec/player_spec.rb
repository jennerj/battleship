require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

RSpec.describe Player do
  before(:each) do
    @player = Player.new
    @ship = Ship.new('Cruiser', 3)
    @ship_with_no_health = Ship.new('Crusier', 0)
    @cell_1 = 'A1'
    @cell_2 = 'A2'
  end

  it 'exists' do
    expect(@player).to be_a(Player)
  end

  it 'asks the player to place their ships' do
    prompt = <<~PRMT
      My ships are placed on the grid!
      Now it's your turn to lay out your two ships.
      The Cruiser is three units long and the Submarine is two units long.
      LETSKITTTTITT!!!
          1 2 3 4
        A . . . .
        B . . . .
        C . . . .
        D . . . .
    PRMT
    expect(@player.player_setup_message).to eq(prompt)
  end

  it 'returns false when ships arent sunk' do
    @player.player_ships << @ship
    expect(@player.all_ships_sunk?).to be false
  end

  it 'returns true when all ships are sunk' do
    @player.player_ships << @ship_with_no_health
    expect(@player.all_ships_sunk?).to be true
  end

  it 'returns a cleared board after a game over' do
    @player.player_board.place(@ship, [@cell, @cell_2])
    old_ships = @player.player_board.ships
    @player.clear_board!
    new_ships = @player.player_board.ships
    expect(new_ships).not_to include(old_ships)
  end
end
