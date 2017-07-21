# Read description 3 times and produce outline
# Have a plan/algorithm
# Use test cases to verify algorithm as it is implemented
# Think about edge cases and fail paths
# Abstract when called for


# Input is a string
#  Empty strings are scored as 0
#  Whitespace is scored as 0
#  nil is scored as zero
# Output is an integer
#  Sum of scores of letter
#  Output is 0 if string is whitespace, empty, or nil

# Algorithm for scoring
# Get input word
# Initialize a sum to zero
# split the string into letters
# get the score of each letter and incrementally add score to sum


class Scrabble
	attr_reader :word


	VALUES_OF_LETTERS = {
	  %w(A E I O U L N R S T) => 1,
	  %w(D G) => 2,
	  %w(B C M P) => 3,
	  %w(F H V W Y) => 4,
	  %w(K) => 5,
	  %w(J X) => 8,
	  %w(Q Z) => 10}

	def initialize(string)
		@word = string
	end

	def score
		sum = 0
		return sum unless word
		word_array = word.upcase.chars

		word_array.each do |char|
			VALUES_OF_LETTERS.each do |k, v|
				sum += v if k.include?(char)
			end
		end
		sum
	end

	def self.score(string)
		Scrabble.new(string).score
	end
end

# Since sum defaults to 0 and only increases if letters present, it will be 0 if string is 
# whitespace, or empty

Scrabble.new('z').score