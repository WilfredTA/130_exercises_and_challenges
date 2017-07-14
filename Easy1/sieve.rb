#ALGORITHM FOR SERIES OF PRIMES
# Given an integer limit, return all numbers betwee 2 and that limit that are prime
# Iterate through range of 2..limit, select all that fulfill the prime condition
# Prime condition: iterate through range from 2 to number - 1, return false if any number in that range
# divides evenly into number


#ALGORITHM FOR SIEVE OF ERASTOTHENES
# Given an integer limit, return all numbers between 2 and that limit that are prime.
# Create a range between 2 and limit
# Begin at 2
# Iterate through every second number up to limit, check if each number is prime
# If prime, place in a collection, else skip
# End iteration 1
# More generally,
# Set beginning number to the (iteration number + 1)
# Incrementally iterate through array, counting every (interation + 1) number
# Check if number is prime
# Place in prime collection if prime, else skip


class Sieve
  attr_reader :limit
  def initialize(limit)
    @limit = limit
  end


  def primes
   numbers = (2..limit).to_a
   primes = []
   numbers.each do |num|
    numbers.each do |number|
      if number % num == 0
       primes << number if prime?(number)
      end
     end
    end
    primes
  end

  private

  def prime?(num)
    2.upto(num - 1) do |number|
      return false if num.remainder(number) == 0
      true
    end
  end



end

sieve = Sieve.new(12)
p sieve.primes

