# Understand the Problem

# Finds the sum of all multiples of a set of given numbers up to but not including a max number
# Input is a max number
# Output is a sum

# The numbers for which multiples should be found defaults to 3 and 5 for the class variable 'to()'
# In new instances of class, constructor method parameters are the numbers for which multiples should be found

# Requirements
# A class method and an instance method 'to'
# A variable storing the default 3 and 5 for class methods
# A way to allow users to input as many numbers for which multiples can be found when making a new instance (*)
# A class sum variable
# An instance sum variable

# The reason we want to separate the variables for class and instance in this case is that class
# always defaults to 3 and 5, while the instances can customize. Further, instantiating new objects of class
# should not modify the default 3 and 5 for the class - so they need to use different variables. The objects
# shouldn't be able to modify the class variable

# Algorithm for finding sum
# iterate over range from 1 upto (limit - 1)
# if num is a multiple of any of the numbers in @nums, add num to sum


class SumOfMultiples
	attr_reader :nums
	@@numbers_for_multiples = [3, 5]

	def initialize(*nums)
		@nums = nums # The numbers for which we must find multiples
	end

	def to(limit)
		sum = 0
		1.upto(limit - 1) do |number|
			sum += number if multiple?(number)
		end
		sum
	end

	def self.to(limit)
		sum = SumOfMultiples.new(*@@numbers_for_multiples)
		sum.to(limit)		
	end

	private

	def multiple?(test_number)
		flag = nil
		nums.each do |number|
			flag = true if test_number % number == 0
		end
		flag
	end

end



#p SumOfMultiples.to(20)