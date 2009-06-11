# Encapsulates the geometry of a 3-sided polygon with a right angle.
# http://mathworld.wolfram.com/RightTriangle.html
class RightTriangle
  
  def initialize(base, height)
    @a, @b = base, height
    @c = hypotenuse
  end
  
  def hypotenuse
     Math.sqrt((@a**2) + (@b**2))
  end
  
  def area
    0.5 * @a * @b
  end
  
private

  def s
    semiperimeter
  end
  
end