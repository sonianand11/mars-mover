# This class will Move rover and accepts input from user
# Run this class : ruby lib/mars_rover.rb [Input]`
# Example : 
# ruby lib/mars_rover.rb "5 5" "1 2 N" "LMLMLMLMM"

require File.expand_path('../rover', __FILE__)
require File.expand_path('../plateau', __FILE__)

class MarsRover
  def run(input)

    plateau_input = input[0]
    rovers_input = input[1..-1]

    return [] if plateau_input.empty? or rovers_input.empty?

    @plateau = create_plateau(plateau_input)

    @number_of_rovers = (input.size - 1)/2

    @rovers = create_rovers(rovers_input)

    navigate_rovers(rovers_input)
    output = @rovers.map{|rover| rover.position }

  end

  private

  def create_plateau(plateau_upper_right_coordinates)
    max_x = plateau_upper_right_coordinates.to_s.split[0].to_i
    max_y = plateau_upper_right_coordinates.to_s.split[1].to_i
    Plateau.new(max_x, max_y)
  end

  def create_rovers(rovers_input)
    rovers = []

    @number_of_rovers.times do |i|
      position = rovers_input[2*i].to_s.split
      x = position[0].to_i
      y = position[1].to_i
      orientation = position[2]
      rovers << Rover.new(x, y, orientation, @plateau)
    end

    rovers
  end

  def navigate_rovers(rovers_input)
    @number_of_rovers.times do |i|
      instructions = rovers_input[2*i + 1].to_s.split(//)
      @rovers[i].navigate(instructions)
    end
  end
end

mars_rover = MarsRover.new

puts "Rover current position : " + mars_rover.run(ARGV).join(" ")