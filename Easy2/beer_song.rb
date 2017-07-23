# The problem
# Input is beer number if one parameter, and range between first and second
# number if two numbers


# Algorithm/Approach
# Get num of beers to begin with.
# Set ending num to beginning num unless explicitly specified
# 







class BeerSong
	attr_accessor :num_of_bottles

	def initialize
		@num_of_bottles = 99
	end

	SPECIAL_VERSES = {
		1 => "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n",
      	2 => "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n",
      	0 =>  "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
	}

	def verse(num_of_beers, ending_num = num_of_beers)
		@num_of_bottles = num_of_beers

		all_verses = []
		loop do
			if SPECIAL_VERSES.keys.include?(num_of_bottles)
				all_verses << SPECIAL_VERSES[num_of_bottles]
			else
				right_verse(all_verses)
			end
			break if num_of_bottles == ending_num
			self.num_of_bottles -= 1
		end

		all_verses.join("\n")
	end

	def lyrics
		verse(99, 0)
	end

	private

	def right_verse(array)
	
      		array << "#{num_of_bottles} bottles of beer on the wall, #{num_of_bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{num_of_bottles - 1} bottles of beer on the wall.\n"
	end

end

p verses = BeerSong.new.verse(10, 8)