# Write a program that given a phrase can count the occurrences of each word in that phrase.

# Understand the problem: 
# Phrase objects with a method #word_count
# Input is a string of words
# Output is a hash

# Rules of word_count method
# Outputs a hash with word keys and frequency values
# Separates words via any non-alpha-numeric char (commas, colons, spaces, etc.)
# Ignores case differences


class Phrase
	attr_reader :string

	def initialize(string)
		@string = string
	end

	def word_count
		counts = Hash.new
		get_words.each do |word|
			counts[word] = get_words.count(word)
		end
		counts
	end


	def get_words
		string.downcase.scan(/[\w']+/).map{|word| word.count("'") >= 2 ? word.delete("'") : word}
	end

end
