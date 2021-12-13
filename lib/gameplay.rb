class Gameplay
  attr_reader :computer, :player

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def start
    puts greeting
    puts play_prompt
    user_input = gets.chomp
  end

  def greeting
    'Greetings land lovers! Today you are at sea and must help protect your country!
    Welcome to BATTLESHIP'
  end

  def play_prompt
    'Enter p to play. Enter q to quit.'
  end

  def user_input
    if 'p'
      puts 'Yo ho ho, All hands on deck!'
      
 end
end
