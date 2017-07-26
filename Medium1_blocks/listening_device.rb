class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
  	@recordings[-1]
  end
end

listener = Device.new
listener.listen #{ "Hello World!" }
listener.listen #{"Another item"}
p listener.play # Outputs "Hello World!"
