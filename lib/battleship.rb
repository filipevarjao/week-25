class Battleship

  attr_accessor :players
  attr_accessor :ships
  attr_accessor :ship_positions

  attr_reader :game_is_over
  attr_reader :game_has_started

  def game_is_over?
    @game_is_over
  end

  def game_has_started?
    @game_has_started
  end

  def initialize
    @game_is_over = false
    @players = []
    @ship_positions = {}
  end

  def add_player(name)
    @players << name
    @ship_positions[name] = {}
  end

  def place_ship(player_name,ship_name,direction,x_position,y_position)

    if game_has_started?
      puts "Sorry #{player_name}, you can't place a ship. The game has already started"
      return
    end

    horizontal = (direction == :horizontal) ? 1 : 0
    vertical = (direction == :vertical) ? 1 : 0

    def iterate(number, x, y, horizontal, vertical)
      @positions = []
      @positions.push([x, y])
      (1..number).each do |p|
        @positions.push([ x + (p * horizontal), y + (p * vertical) ])
      end
    end

    if ship_name == :battleship
      iterate(3, x_position, y_position, horizontal, vertical)
    elsif ship_name == :carrier
      iterate(2, x_position, y_position, horizontal, vertical)
    else
      iterate(1, x_position, y_position, horizontal, vertical)
    end

    ship_positions[player_name][ship_name] = @positions
  end

  def shoot(at_player_with_name,x_position,y_position)

    if game_is_over?
      puts "GAME IS OVER! Start a new game!"
      return
    end

    sunk_ship = @ship_positions[at_player_with_name].find do |ship_name,ship_positions|

      hit_at_position = ship_positions.find do |position|
        if (position.first == x_position and position.last == y_position)
          puts "#{at_player_with_name}'s #{ship_name} has been HIT!"
          true
        else
          puts "MISS!"
          false
        end
      end

      if hit_at_position
        puts "Marking hit #{hit_at_position}"
        @ship_positions[at_player_with_name][ship_name].delete hit_at_position

        if ship_positions.empty?
          true
        else
          false
        end
      end
    end

    if sunk_ship
      puts "YOU HAVE SUNK #{at_player_with_name}'s #{sunk_ship.first}!"
      @ship_positions[at_player_with_name].delete sunk_ship.first
    end

    if @ship_positions[at_player_with_name].empty?
      puts "PLAYER #{at_player_with_name} has been defeated!"
      @game_is_over = true
    end
  end

end
