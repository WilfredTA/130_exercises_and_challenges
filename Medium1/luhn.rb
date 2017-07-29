class Luhn
	attr_accessor :num

	def initialize(num)
		@num = num.class == Integer ? num : num.to_i
	end

	def self.create(num) # returns num if num is valid, else iterates and check if num + digit makes num valid
		luhn = Luhn.new(num)
		return luhn.num if luhn.valid?
		0.upto(9) do |digit|
			tester = Luhn.new(self.add_digit(luhn.num, digit))
			return tester.num if tester.valid?
		end
	end

	def self.add_digit(num, digit)
		(num.to_s << digit.to_s).to_i
	end

	def addends
		addends = []
		num.to_s.chars.map(&:to_i).reverse.each_with_index do |num, idx|
			if idx.odd?
				if (num*2) >= 10
					addends << (num*2) - 9
				else
					addends << (num*2)
				end
			else
				addends << num
			end
		end
		addends.reverse
	end

	def checksum # adds up all the digits of num
		addends.reduce(&:+)
	end

	def valid? #checksum ends in 0?
		checksum % 10 == 0
	end

end
