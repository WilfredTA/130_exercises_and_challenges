# The problem:

# A buffer starts empty at some pre-defined length

# Starting location does not matter since it is connected
# end to end like a ring.

# First in, first out
# Reading from buffer deletes the element in the buffer
# starting from oldest

# When buffer is full, forced overwrite replaces oldest values

# overwritten data is considered newest

# Rules

# Oldest needs to be kept track of for overwrites and reads
# overwrites delete oldest data, and then consider overwritten data as newest

# Sub-Problems to solve
# Model the newest-oldest function
# Read data from buffer
# Write data to buffer
#
# Data Structure
# Use an array for the buffer because it can
# push data in from one side, meaning left most data is oldest
# Solve overwrite problem like this by deleting oldest data then pushing
# overwritten data. This is because the index of the old data being
# overwritten is irrelevant if replacement data is considered newest, therefore
# position does not need to be preserved


# Write
# input is any value
# if buffer full, instead overwrite element at rightmost index
# else
# all elements in buffer shifted to the left
# last element in buffer is empty
# place input in last element in buffer

# Read
# Deletes leftmost value and returns it
# Adds new blank value

class CircularBuffer
	attr_accessor :buffer

	class BufferEmptyException < StandardError; end

	class BufferFullException < StandardError; end

	def initialize(size)
		@buffer = Array.new(size, '')
	end

	def write(value, exception=true)
		raise BufferFullException if full? && exception
		if value != nil
			array = buffer
			array << '' #Adds blank value to the end of array
			array.delete_at(0) # deletes leftmost(oldest) value (either blank or oldest value to overwrite)
			array[-1] = value # assigns blank value added above to value passed into write
			self.buffer = array
		end
	end

	def write!(value)
		write(value, false)
	end

	def read
		raise BufferEmptyException if empty?
		read_value = nil
		buffer.each_with_index do |el, idx| #since method will be deleting element, has to delete with idx just in case there are duplicate elements
			if el != ''
				read_value = buffer.delete_at(idx) #stores the return value of deleting oldest element
				break
			end
		end

		self.buffer = buffer.reverse << ''
		buffer.reverse!
		read_value
	end

	def clear
		self.buffer = CircularBuffer.new(buffer.size).buffer
	end

	def empty?
		buffer.each do |element|
			return false unless element == ''
		end
		true
	end

	def full?
		buffer.each do |element|
			return false if element == ''
		end
		true
	end
end


buf = CircularBuffer.new(5)
(1..3).each do |i|
	buf.write(i)
end

p buf.buffer
p buf.read
p buf.buffer
