class CircuitBoard
  def initialize(working:)
    @working = working
  end

  def inspect
    "#<CircuitBoard:#{object_id}>"
  end

  def working?
    @working
  end
end
