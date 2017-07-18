# Understand the problem
# Object has an attribute which is a string of letters
# Input of hamming distance method is a string of a combo of letters 'A' 'C' 'G' 'T'
# Output is the number of differences between the attribute string and the input string
# Rules of program: 
	# Output 0 of either input or original string contains 0 letters
	# Output 0 for no differences
	# If strings are different lengths, the two strings up to the length of the shorter
		# string, ignoring the extra chars on longer string
	# Longer string should not be modified when performing above step


# Algorithm for hamming distance
# Check if strings are same length. If strings are of different lengths, get last index of shorter
	# string and get a new string equal to longer string from first index up to last index of shorter
	# string. 
# Iterate over one of strings, selecting all elements which do not match element of other string at 
	# same index
# Return the size of the array of mismatched elements

class DNA

	def initialize(strand)
		@strand = strand
	end

	def hamming_distance(other_strand)
		if longer?(@strand, other_strand)
			strand = make_longer_strand_same_length(@strand, other_strand)
		elsif longer?(other_strand, @strand)
			other_strand = make_longer_strand_same_length(@strand, other_strand)
		end


		mutations = []

		other_strand.chars.each_with_index do |nucleic_acid, idx|
			mutations << nucleic_acid if nucleic_acid != @strand[idx]

		end

		mutations.size
	end

	private

	def longer?(comparator, compared_to)
		comparator.length > compared_to.length
	end

	def make_longer_strand_same_length(original_strand, other_strand)
		if other_strand.size > original_strand.size
			cut_off(other_strand, original_strand.size)
		else
			cut_off(original_strand, other_strand.size)
		end
	end

	def cut_off(strand_to_be_cut, max_size)
		strand_to_be_cut[0..(max_size - 1)]
	end
end

dna = DNA.new("AGTCAT")
p dna.hamming_distance("AGTCATT")
