require 'test_helper'

class MarsRoverTest < Minitest::Test
  def setup    
    @mars_rover = MarsRover.new
  end

  def test_run
    assert_equal [], @mars_rover.run(["5 5"])
  end

  def test_one_rover
    assert_equal ["1 3 N"], @mars_rover.run(["5 5", "1 2 N", "LMLMLMLMM"])
  end

  def test_multiple_rover
    assert_equal ["1 3 N", "5 1 E"], @mars_rover.run(["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"])
  end

end
