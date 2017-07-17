# Understand the problem
# Input: A llist of words
# Output: A list of words containing all anagrams of a word; the word is stored as an attribute of an object
# Rules of program: 
	# Case insensitive
	# Has a method called match, which outputs the anagrams
	# Has a method called sort, which sorts output of 'match' in alphabetical order
	# When no matches are found, output an empty array
# Rules of anagram: 
	# Must contain all letters in right quantity: 
	# 	Cannot contain extra letters in original word
	# 	Cannot contain extra letters not in original word



class Anagram
	attr_reader :word

	def initialize(original_word)
		@word = original_word
		@anagrams = []
	end

	def match(word_list)
		@anagrams = word_list.select do |item|
			same_letters?(item)
		end
	end


	def sort
		@anagrams.sort
	end

	private

	def same_letters?(item)
		return false if item.downcase == word.downcase
		comparator = word.downcase.chars.sort
		item.downcase.chars.sort == comparator
	end
end

ana = Anagram.new("hi")
p ana.match(%w( Hi ih ph hp))

