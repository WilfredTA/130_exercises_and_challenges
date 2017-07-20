# how to work with a coding problem
# don't underestimate; resist the urge to dive into code
# read the description 3 times; produce an outline if necessary
# communicate and clarify
# have a plan (algorithm) and verify with that
# test cases (happy paths, fail paths, edge cases)
# manage your energy
# Think about abstractions

# If a problem seems too easy, you either underestimated the code
# or you're applying for the wrong company! If you are applying for a good company
# it is certain that the code challenge will not be easy

# Sometimes the problem description is so large, it takes 2 minutes to read.
# You will probably want to refer to problem descirption multiple times throughout
# writing the program. It is very hard to sift thru the large description
# and spend 2 minutes reading every time you need to refer to problem description.
# This is solved with an outline.


# If there is any ambiguity, you should ask the questions up front


# The plan/algorithm is important. Don't write everything out/go thru every single 
# detail; have a balance of general and specific. Verify with test cases, either
# ones that have come with the problem or not. 

# When trying to use test cases, think about the happy path (most obvious way to make test work)
# as well as how to deal with the fail paths and edge cases (edge cases are valid inputs but somewhat
# on the edge of being error)

# Once you have test cases, use your test cases to verify the plan/algorithm as you implement
# it.

# Abstractions. Part of the solution is to break up the solution into smaller
# problems that need to be solved.

# _________________________________________________________________________

# THE PROBLEM

# Consider a character set consisting of letters, a space, and a point. Words
# consist of one or more, but at most, 20 letters. An input text consists of
# one or more words separated from each other by one or more spaces and terminated
# by 0 or more spaces followed by a point. Input should be read from, and including
# the first letter of the first word, up to and including the terminating point. The output
# text is to be produced such that successive words are separated by a single space
# with the last word being terminated by a single point. Odd words are copied in reverse order
# while even words are merely echoed. For example, the input string:
# " whats the matter with kansas." becomes "whats eht matter htiw kansas."

# BONUS POINTS: The characters must be read and printed one at a time.




# Program description

# StringReverser.reverse takes a string as input and splits the words in the string
# into an array. It then returns the value of calling StringReverser.fix_individual_terminating_point on the array of words.


# StringReverser.fix_individual_terminating_point takes a block and an array. Once the array and block are passed to the method,
# the method stores the block as a variable reverser_block and then
# the method checks if either the array contains a period element, or if the last element of the array contains 
# a period element.
#
# If the former, the period is its own element in the array, the period element is deleted from the array, 
# Then the new array, as well as the block, 
# is passed to a second method. The second method passes 
# the array into the block (which reverses every odd word) and turns the transformed array into a string.
# The return value of the block is stored as a variable in the method. 
# The method appends a period to the last element in the string of reversed words and returns the
# transformed string
#
# If the latter, the period is the last element of the last element of the array.
# The period is deleted, and then the block and new array are passed to a second method.
# The second method passes the array into the block, which transforms the array, and then
# turns the array into a string. The block returns this string.
# The method stores the string as a variable and then appends a period to the 
# last element of the string.

# Requirements of program
# Input: 
# 	At least 1 word, no limit to words
# 	Spaces between words: at least 1, no limit to spaces
# 	Termination: At least 0 spaces, no limit to spaces, followed by a point
# Output: 
# 	Odd words reversed
# 	Words separated by one space
# 	Period appended to end of sentence,; no spaces between last word and period
# Test Cases
# 	'hello world .' should yield 'hello dlrow.'
# 	'    hello     world.' => should yield 'hello dlrow.'


# General Approach/Algorithm
# Get input string
# Split string into array of words
# Reverse odd words
	# - if string ends with a dot, dot is kept at the end*
	#
	# 	- if dot is attached to last indexed word and the word is odd
	# 	  	- then the word is reversed but the dot stays at the end
	# 	- if the dot is placed as its own element in the array as a result of split
	# 	  	- the dot does not interfere with the indices of the words
	# 	  	- and the dot is at the end of the last word of the output string
# Join the words back into a string

# * Situation calls for sandwich code: 
# In either case, deleting the dot, reversing the words, and appending the dot again seems
# best course of action. This is because even if the dot is attached to the last word
# if that last word is an odd index, then the dot will be reversed as well and will be at the
# beginning of the reversed version of the word. 
# If the dot is its own element in the array (which would be the case if input had a space between last word and dot)
# then joining the array back at the end will retain the space between last word and dot. Best course of action
# is to delete the dot and then reverse then append at the end.


class StringReverser

	def self.reverse(string)
		array_of_words = string.split(' ')

		reversed_sentence = self.fix_individual_terminating_point(array_of_words) do |array|
			array.map do |word|
				self.odd_word(word, array_of_words)
			end.join(' ')
		end
	end

	private

	def self.odd_word(word, array)
		if array.index(word) % 2 != 0
			word.reverse
		else
			word
		end
	end

	def self.fix_individual_terminating_point(array, &reverser_block)
		if array.include?('.')
			array.delete('.')
			reverse_words_then_add_period(array, &reverser_block)
		elsif array[-1][-1] == '.'
			array[-1].chop!
			reverse_words_then_add_period(array, &reverser_block)
		else
			yield(array)
		end
	end

	def self.reverse_words_then_add_period(array)
		reversed_odd_words = yield(array)
		reversed_odd_words[-1] += '.'
		reversed_odd_words
	end
end

p StringReverser.reverse("whats the matter with kansas lolol haha not my problem .")


