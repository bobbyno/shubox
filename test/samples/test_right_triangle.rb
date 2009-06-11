require 'test/unit'
require File.join(File.dirname(__FILE__), '..', 'constants')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'samples', 'right_triangle')

# An example of testing a class in the lib folder.
class TestRightTriangle < Test::Unit::TestCase 
  
  def setup
    @small = RightTriangle.new(3, 4)
    @big = RightTriangle.new(120, 160)
  end

  def test_hypotenuse
    assert_equal(5, @small.hypotenuse)
    assert_equal(200, @big.hypotenuse) 
  end

  def test_area    
    assert_equal(6, @small.area)
  end

end