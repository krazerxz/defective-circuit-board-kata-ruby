class BoardGenerator
  def new_set
    Array.new(10).map do
      CircuitBoard.new
    end
  end
end
