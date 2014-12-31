class Triangle
	def initialize(a,b,c)
		@a, @b, @c = a,b,c
	end
	#accessors and mutators
	attr_accessor :a, :b, :c

	def perimeter
		(@a+@b+@c)/2
	end

	def area
		#using q for readability
		q = self.perimeter
		#Haron's formula
		Math.sqrt(q * (q - a) * (q - b) * (q -c))
	end	
	def equilateral?
		#super short and awesome
		#if a == b and b==c then a==c
		@a==@b && @b==@c 
	end
	def isosceles?
		@a==@b || @a == @c || @b == @c
	end
	def right?
		#using pythag theo
		@a**2+@b**2==@c**2 || @a**2+@c**2==@b**2|| @b**2+@c**2==@a**2
	end
	#test if object actually is a triangle
	def test?
		@a+@b > @c && @a+@c > @b && @b+@c > @a
	end
	#check if object is NOT a triangle
	def not?
		self.test != true
	end
	def scalene?
		a!=b && b!=c
	end
	def to_s
		puts"\na = #@a, b = #@b, c = #@c"
	end
end

class Sphere
	def initialize(radius)
		@radius = radius	
	end
	#accessors and mutators
	attr_accessor :radius 

	def area
		Math::PI * 4 * @radius**2
	end
	def volume
		Math::PI * 4 * @radius**3 / 3
	end
end
#Ball inherits from sphere.
class Ball < Sphere
	def initialize(radius, color)
		super(radius)
		@color=color
	end
	#extendeing accessor and mutators
	attr_accessor :color
end
#MyBall inherits from ball
class MyBall < Ball
	def initialize(radius, color, owner)
		super(radius, color)
		@owner= owner
	end
	attr_accessor :owner
	def show
		puts "\nradius: #@radius, color: #@color, owner: #@owner\n" 
	end
end

def main
	array1 = [0,1,2,3,4,5,6,7,8,9]
	array2 = [5,10,15,20,25]

	#demonstrate iterator 'each'
 	array1.each do|x|
		print "%d " %x 
	end
	puts "" 
	a2 = array1.collect {|x|x+=1}
	a2.each do |x|
		print " %d" %x
	end
	puts
end
