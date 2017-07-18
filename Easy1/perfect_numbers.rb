# Understand the Problem

# The categories of numbers
# Perfect
# Abundant
# Deficient

# To determine if test_number is perfect, iterate from 1 upto test_number - 1
# Find all numbers which yield a remainder of 0 when divided into test_number
# Sum all of the numbers which evenly divided into test_number
# If sum == test_number, number is perfect
# If less than, then number is deficient
# If greater than, then number is abundant

# Input is a number
# Output is a string representing if input is perfect, abundant, or deficient
# Requirements of program
# Class method classify(num)
# Raise runtime error if number is negative

class PerfectNumber
	def self.classify(num)
		raise RuntimeError if num < 0
		if find_sum_of_factors(num) == num
			"perfect"
		elsif find_sum_of_factors(num) > num
			"abundant"
		elsif find_sum_of_factors(num) < num
			"deficient"
		end
	end

	private

	def self.find_sum_of_factors(num)
		sum = []
		1.upto(num - 1) do |number| 
			sum << number if num % number == 0
		end
		sum.reduce(&:+)
	end
end
