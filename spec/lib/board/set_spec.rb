require 'spec_helper'

describe Board::Set do
  let(:working_circuit_board) { CircuitBoard.new(working: true) }
  let(:faulty_circuit_board)  { CircuitBoard.new(working: false) }

  describe 'correct_identification_of_all_boards' do
    let(:boards) { [working_circuit_board, working_circuit_board, faulty_circuit_board] }
    subject      { described_class.new(boards) }

    it 'returns which boards are working/faulty' do
      expected_result = [true, true, false]
      expect(subject.correct_identification_of_all_boards).to eq expected_result
    end
  end

  describe 'defective_boards' do
    let(:boards) { [working_circuit_board, faulty_circuit_board, faulty_circuit_board] }
    subject      { described_class.new(boards) }

    it 'returns the number of boards that are defective' do
      expect(subject.defective_boards).to eq 2
    end
  end

  describe 'correctly_identify_one_faulty_board' do
    let(:boards) { [working_circuit_board, faulty_circuit_board, faulty_circuit_board] }
    subject      { described_class.new(boards) }

    before do
      srand(101)
    end

    it 'returns which boards are working/faulty with one being inforrectly marked as working' do
      expected_result = [true, false, true]
      expect(subject.correctly_identify_one_faulty_board).to eq expected_result
    end
  end

  describe 'incorrectly_identify_one_working_board_as_faulty' do
    let(:boards) { [working_circuit_board, working_circuit_board, working_circuit_board] }
    subject      { described_class.new(boards) }

    before do
      srand(100)
    end

    it 'returns the state of each circuit board apart from one false negative' do
      expect(subject.incorrectly_identify_one_working_board_as_faulty).to eq [true, false, true]
    end
  end
end
