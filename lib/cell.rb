class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @empty = true
    @fired_upon = false
  end

  def empty?
    if @ship.nil?
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @ship.hit if empty? != true
    @fired_upon = true
  end

  def render(reveal = false)
    if @fired_upon
      'M'
    elsif ship && reveal
      'S'

    else
      '.'
    end
  end
end
