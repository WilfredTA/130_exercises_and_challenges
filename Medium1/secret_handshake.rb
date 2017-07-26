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
		# e.g. 0111 corresponds to 100, 10, and 1
# Since 1 digit is at the very right, string must be reversed in order to encounter it first
#

# Data structure
# Store these as same order they would appear in string representation of 1 and 0's
# ["wink", "double blink", "close your eyes", "jump", lambda to reverse string]