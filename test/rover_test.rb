require 'test_helper'

class RoverTest < Minitest::Test
  def setup    
    @rover = Rover.new(1,2,"N",Plateau.new(5,5))
  end

  def test_position
    assert_equal "1 2 N", @rover.position
  end

  def test_navigate
    @rover.navigate("LMLMLMLMM".to_s.split(//))    
    assert_equal "1 3 N",@rover.position
  end

end
