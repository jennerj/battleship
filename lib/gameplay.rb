class Gameplay
  attr_reader :computer, :player

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def start
    puts greeting
    puts play_prompt
  end

  def greeting
    'Greetings land lovers! Today you are at sea and must help protect your country!
    Welcome to BATTLESHIP'
  end

  def play_prompt
    'Enter p to play. Enter q to quit.'
  end
end
