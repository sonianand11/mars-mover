class Rover
  def initialize(x, y, orientation, plateau)
    @x = x
    @y = y
    @orientation = orientation
    @plateau = plateau
  end

  def position
    "#{@x} #{@y} #{@orientation}"
  end

  def navigate(instructions)
    instructions.each do |command|
      case command
      when "L" then turn_left
      when "R" then turn_right
      when "M" then move_forward
      end
    end
  end

  private

  def turn_left
    case @orientation
    when "N" then @orientation = "W"
    when "E" then @orientation = "N"
    when "S" then @orientation = "E"
    when "W" then @orientation = "S"
    end
  end

  def turn_right
    case @orientation
    when "N" then @orientation = "E"
    when "E" then @orientation = "S"
    when "S" then @orientation = "W"
    when "W" then @orientation = "N"
    end
  end

  def move_forward
    case @orientation
    when "N" then @y += 1 if @y < @plateau.max_y
    when "E" then @x += 1 if @x < @plateau.max_x
    when "S" then @y -= 1 if @y > 0
    when "W" then @x -= 1 if @x > 0
    end
  end
end
