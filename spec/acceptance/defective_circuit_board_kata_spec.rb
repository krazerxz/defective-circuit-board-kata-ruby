require 'spec_helper'

describe 'the circuit board tester operates as expected' do
  let(:working_circuit_board) { CircuitBoard.new(working: true) }
  let(:faulty_circuit_board)  { CircuitBoard.new(working: false) }

  subject { Board::Tester }

  before do
    srand(100)
  end

  describe 'test' do
    context 'exactly one circuit board is defective' do
      it 'correctly identifies a faulty board' do
        outcome = subject.test([working_circuit_board, working_circuit_board, faulty_circuit_board])
        expect(outcome).to eq [true, true, false]
      end
    end

    context 'two circuit boards are defective' do
      it 'correctly identifies, at random, a faulty board' do
        outcome = subject.test([working_circuit_board, faulty_circuit_board, faulty_circuit_board])
        expect(outcome).to eq [true, true, false]
      end
    end

    context 'all circuit boards are functioning' do
      it 'incorrectly identifies a board as defective' do
        outcome = subject.test([working_circuit_board, working_circuit_board, working_circuit_board])
        expect(outcome).to eq [true, false, true]
      end
    end
  end
end
