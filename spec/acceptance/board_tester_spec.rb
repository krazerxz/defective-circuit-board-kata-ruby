require "spec_helper"

describe BoardTester do
  let(:working_circuit_board) { CircuitBoard.new(working: true) }
  let(:faulty_circuit_board)  { CircuitBoard.new(working: false) }

  subject{ described_class.new }

  before do
    srand(100)
  end

  describe "test" do
    context "exactly one circuit board is defective" do
      it "correctly identifyies a faulty board" do
        outcome = subject.test([working_circuit_board, working_circuit_board, faulty_circuit_board])
        expect(outcome).to eq [true, true, false]
      end
    end

    context "two circuit boards are defective" do
      it "correctly identifyies, at random, a faulty board" do
        outcome = subject.test([working_circuit_board, faulty_circuit_board, faulty_circuit_board])
        expect(outcome).to eq [true, true, false]
      end
    end

    context "all circuit boards are functioning" do
      it "incorrectly identifies a board as defective" do
        outcome = subject.test([working_circuit_board, working_circuit_board, working_circuit_board])
        expect(outcome).to eq [true, false, true]
      end
    end
  end
end
