require "spec_helper"

describe BoardTester do
  let(:working_circuit_board_1) { CircuitBoard.new(faulty: false) }
  let(:working_circuit_board_2) { CircuitBoard.new(faulty: false) }
  let(:working_circuit_board_3) { CircuitBoard.new(faulty: false) }
  let(:faulty_circuit_board_1)  { CircuitBoard.new(faulty: true) }

  subject{ described_class.new }

  describe "faulty_board?" do
    context "one circuit board is defective" do
      it "correctly identifyies a faulty board" do
        outcome = subject.faulty_board?([working_circuit_board_2, working_circuit_board_2, faulty_circuit_board_1])
        expect(outcome).to be true
      end
    end
  end
end
