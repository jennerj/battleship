class Gameplay
  attr_reader :computer,
              :player

  def initialize(skrrt)
    @skrrt = skrrt
    @computer = Computer.new
    @player = Player.new
  end

end
