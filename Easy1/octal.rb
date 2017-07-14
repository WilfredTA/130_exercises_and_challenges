# Base 10: 

# From right to left: x * 10 ^ 0, x * 10 ^ 1, etc..
# More generally, base 10 considers numbers
# from right to left, where leftmost number is given an index of 1.
# From right to left, numbers are summed, multiplying the digit by 10 ^ index -1
# 233 = 2 * 10^2 + 3 * 10 ^ 1 + 3 * 10 ^ 0 == 200 + 30 + 3


# Octal (Base 8):
# Left most numbers is given an index of 1
# From left to right, digits are multiples by (digit * 8 ^ index -1) and digits are 
# incrementally summed


class Octal
	attr_reader :octal_string


	def initialize(octal_num)
		@octal_string = octal_num
	end

	def to_decimal
		return 0 if invalid_octal?
		decimal_num = 0
		octal_string.reverse.chars.each_with_index do |char, idx|
			decimal_num += char.to_i * (8 ** idx)
		end

		decimal_num
	end

	private

	def invalid_octal?
		octal_string =~ /\D|[8-9]/

	end

end


octal = Octal.new('17')
p octal.to_decimal