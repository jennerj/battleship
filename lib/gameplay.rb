class Gameplay
  attr_reader :computer,
              :player

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

end
