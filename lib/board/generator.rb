module Board
  class Generator
    def self.new_set
      circuit_states = [true, true, true, true, true, true,
                        true, true, false, false].shuffle
      circuit_states.map { |state| CircuitBoard.new(working: state) }
    end
  end
end
