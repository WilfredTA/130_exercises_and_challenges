# Key requirements / Outline of Problem

# Input:
# Take an integer or 
# A string of binary

# Validation: 
# Invalid binary string is interpreted as binary 0

# Logic: 
# - Convert input to appropriate sequences of events for a secret handshake

#1 = wink
#10 = double blink
#100 = close your eyes
#1000 = jump
# 10000 = Reverse the order of the operations in the secret handsha#ke.


# Model the solution

# Convert integer into binary string
# Get last 5 digits of string
# Lookup the binary string in lookup table
# 	- Each digit maps to a string: '0' is empty string whereas '1' maps to the string
# 		which has the same number of digits after it that the binary in the table haz 0's
		# e.g. 0111 corresponds to nothing, then 100, then 10, and finally 1
# Since 1 digit is at the very right, string must be reversed in order to encounter it first. This is because
# if the string is not reversed, then you don't know if the left most number will represent 100 or 1000: you'll have to count
# ahead and then come back, which is far more complicated.
#

# Data structure
# Store these as same order they would appear in string representation of 1 and 0's
# ["wink", "double blink", "close your eyes", "jump", some way to reverse the sequence of handshakes]


class SecretHandshake
	attr_reader :code, :handshake_sequence
	COMMANDS = ["wink", "double blink", "close your eyes", "jump", 'reverse']


	def initialize(number)
		@code = number.class == Integer ? number.to_s(2).reverse : number.reverse
		@handshake_sequence = []
	end

	def commands
		COMMANDS.each_with_index do |action, idx|
			handshake_sequence << action if code.chars[idx] == '1'
		end
		reverse(handshake_sequence)
	end

	def reverse(var)
		var.reverse!.shift if var[-1] == 'reverse'
		var
	end

end