# Input is a string of letters representing nucleotides
# Output is an array of amino acids corresponding to the codons
# Codons are groups of 3 nucleotides

# If codon is invalid, raises InvalidCodon error

# Stop codon input generates "STOP" as output

# of rna method uses of_codon method

# What if input strand doesn't contain a multiple of 3 letterS?
class InvalidCodonError
	def exception
		Exception.new("Invalid Codon Error")
	end
end

class Translation

	ACIDS = {

		"Methionine" => ["AUG"],
		"Phenylalanine" => ["UUU", "UUC"],
		"Serine" => ["UCU", "UCC", "UCA", "UCG"],
		"Tyrosine" => ["UAU", "UAC"],
		"Cysteine" => ["UGU", "UGC"],
		"Tryptophan" => ["UGG"],
		"Leucine" => ["UUA", "UUG"],
		"STOP" => ["UAA", "UAG", "UGA"]
	}

	def self.of_codon(codon)
		ACIDS.select{|acid, codon_array| codon_array.include?(codon)}.keys.first
	end


	def self.of_rna(strand)
		# initialize array to store amino acids
		# split strand into array of groups of three
		# iterate over array, calling of_codon on each triplet
		# break if the result == "STOP"
		# place the result in the array
		# return the array
		codons = get_codons(strand)
		protein = []

		codons.each do |codon|
			fail InvalidCodonError.new unless valid_codon?(codon)

			if self.of_codon(codon) == "STOP"
				break
			else
				protein << self.of_codon(codon)
			end
		end
		protein
	end

	def self.get_codons(strand)
		codons = []
		codon = ''
		counter = 0
		strand.chars.each do |letter|
			codon << letter 
			counter += 1
			if counter % 3 == 0
				codons << codon
				codon = ""
			end
		end
		codons
	end

	def self.valid_codon?(codon)
		ACIDS.values.flatten.include?(codon)

	end


end

#p Translation.of_rna("UCUUCCUCA")