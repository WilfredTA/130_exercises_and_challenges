# Understand the problem
# Given a number 'n', split the number into digits. Index of digits goes from left to right
# in ascending order, starting at 0
# To convert a trinary number to a decimal number, take the sum of performing the following
# operation on each digit: n * (3 ^ index)

#Input: String representing trinary number
# Output: decimal version of trinary num
# Rules: Trinary numbers only include 0's, 1's, and 2's
# 	If input includes anything else, return 0

# Requirements in solution: Check for invalid input
# Use the index
# Use a constant base of 3
# convert string to number
# Iterate --> Array
# A sum

class Trinary
	attr_reader :trinary
	BASE = 3
	def initialize(trinary_num)
		@trinary = trinary_num
	end

	def to_decimal
		sum = 0
		return sum if invalid_input?
		trinary.chars.reverse.each_with_index do |char, idx| # Reverse since each_with_index counts index from right -> left, not left -> right
			sum += char.to_i * (3 ** idx)
			puts idx
		end
		sum
	end

	private 

	def invalid_input?
		trinary =~/\D|[3-9]/
	end

end

trinary = Trinary.new('102012')
p trinary.to_decimal