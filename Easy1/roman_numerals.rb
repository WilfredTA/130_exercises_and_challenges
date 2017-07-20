# Understand the problem
# Convert an arabic number to a roman numeral

# Looking at test case, we see that you start with the
# leftmost digit and get the numeral for it. Then reduce the starting
# number by the leftmost digit quantity. 
#. E.g. 1990 ==> roman numeral:
# 1000 (left most digit is 1000) -> M
# 1990 - 1000 = 990
# 900 (leftmost digit of 990 is 900) -> CM
# 990 - 900 = 90
# 90 -> XC
# Full roman numeral is MCMXC

# Represent the rules with code using a data structure
# of choice or with logic

# The reason we need 900, 400, 90, 40, 9, and 4 hard coded
# is that roman numerals have different rules for representing
# digits immediately preceding the next numeral: Adding three 10's
# is adding three X's, but adding 4 10's is subtracting one ten from 50


# Determine a way to first find if there is a thousand
# in integer, and if so, how many thousands. Then onto CM,, etc.

# Refactor: Remove the need to add anything into key except 1000, 500, 100, 50, 10, and 1 (yet to implement)

# Disclaimer: Ugliest code I've ever written... will refactor... 5 tests still fail - will also fix this soon


class Integer
	ROMAN_NUMERAL_RULES = {
		1000 => 'M',
		900 => 'CM',
		500 => 'D',
		400 => 'CD',
		100 => 'C',
		90 => 'XC',
		50 => 'L',
		40 => 'XL',
		10 => 'X',
		9 => 'IX',
		5 => 'V',
		4 => 'IV',
		1 => 'I'
		}

def to_roman
	convert_to_numerals = make_array_of_numeral_numbers
	roman_numeral = ''
	
	counter = 0
	loop do
		break if counter > convert_to_numerals.size - 1
		current_number = convert_to_numerals[counter]
		roman_numeral += ROMAN_NUMERAL_RULES[current_number]
		counter += 1
	end
	roman_numeral
end

def make_array_of_numeral_numbers
	array_of_whole_numbers = []
	remaining_number = self
	loop do
		amount_of_zeroes = (remaining_number.to_s.size) - 1
		number_representing_numeral = (remaining_number.to_s[0] +'0' * amount_of_zeroes).to_i
		array_of_whole_numbers <<  number_representing_numeral
		remaining_number -= number_representing_numeral
		break if remaining_number == 0
	end
	simplify_array(array_of_whole_numbers)
	#array_of_whole_numbers
end

def simplify_array(array)
array_of_numbers_for_numerals = []

	array.each do |number|
		if ROMAN_NUMERAL_RULES.keys.include?(number)
			array_of_numbers_for_numerals << number
			next
		else
			num = '1' + '0' * (number.to_s.size - 1)
			number.to_s[0].to_i.times do 
				array_of_numbers_for_numerals << num
			end
		end
	end
	array_of_numbers_for_numerals.map do |string|
		string.to_i
	end
end



end

p 575.make_array_of_numeral_numbers
