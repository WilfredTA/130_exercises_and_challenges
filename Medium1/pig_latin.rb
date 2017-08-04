# Input: text string
# Output: text string

#Rules of pig latin:
# 1. If a word begins with a vowel SOUND, add "ay" to the end of word
# 2. If a word begins with a consonant SOUND, move consonant to end of word then 
	# "ay" sound to end of word
# Rules of program:
	# If input is sentence, applies rules to each
		# word in sentence

# Edge cases:
	# 'qu' is a vowel sound
	# if a vowel follows a 'y', then 'y' is treated as a consonant
	# x is a consonant if followed by a vowel, else x is a vowel

# Pig latin algorithm
	# If word begins with consonant, append "consonant+ ay" and delete consonant from beginning
	# If word begins with "y", check next letter
		# if next letter is vowel, treat as consonant
		# else treat as vowel
	# If word begins with vowel, append "ay"


class PigLatin
	CONSONANTS = %w(B C D F G H J K L M N P Q R S T V W Z)
	VOWELS = %w(A E I O U)
	EDGE_CASES = Proc.new do |word|
		return_value = false
		(return_value = "qu" if word[0].downcase == "q" && word[1].downcase == "u")
		(return_value = "y" if word[0].downcase == "y" && VOWELS.include?(word[1].upcase))
		(return_value = "x" if word[0] == "x" && VOWELS.include?(word[1].upcase))
		return_value
	end

	def self.translate(string)
		string.split(' ').map do |word|
			if begin_with_consonant?(word, &EDGE_CASES)
				treat_as_consonant(word, &EDGE_CASES)
			else
				treat_as_vowel(word)
			end

		end.join(' ')
	end

	def self.begin_with_consonant?(word, &block)
		return true if yield(word)
		CONSONANTS.include?(word[0].upcase)
	end

	def self.treat_as_vowel(word)
		word << "ay"
	end
	

	def self.treat_as_consonant(word, &block)
		if yield(word)
			to_delete = yield(word)
			word.delete!(to_delete)
			word << to_delete + "ay"
		else
			limit = 0
			array = word.chars
			array.each_with_index do |char, index|
				if char == "u" && array.at(index - 1) == "q"
					limit = index
				elsif VOWELS.include?(char.upcase)
					limit = index - 1 
				end
				break if VOWELS.include?(char.upcase)
			end

			consonants = array.slice!(0..limit)
			array << consonants
			array.join('') << "ay"
		end
	end
end


