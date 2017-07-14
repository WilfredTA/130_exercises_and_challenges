# Write a program that will take a string of digits and give you 
# all the possible consecutive number series of length n in that string.

# UNDERSTAND THE PROBLEM
# From test suite, the following structure makes most sense
class Series
	attr_reader :digits

	def initialize(string_of_digits)
		@digits = string_of_digits
	end


	def slices(length_of_series)
		fail(ArgumentError, 'size of slice too large') if digits.size < length_of_series

		dig_array = @digits.chars.map(&:to_i)
		collection = []
		dig_array.each_cons(length_of_series) do |series|
			collection << series
		end
		collection
	end

end

# REQUIREMENTS
# Series#slices must find every combo of digits in @digits
# that is the length of length_of_each_series and store those combos
# as a nested array

# Must raise an argument error if length_of_each_series > size of @digits



# ALGORITHM FOR SLICES
# dig_array = array of digits in @digits
# An empty array to store combinations
# Iterate over dig_array
# element at index 0 to element at n - 1
# increment n - 1 and 0



