require 'spec_helper'

describe BoardTester do
  subject{ described_class.new }

  describe 'test' do
    let(:board_set) { double(:board_set) }

    before do
      allow(BoardSet).to receive(:new).with(:array_of_boards).and_return(board_set)
    end

    context 'there is one defective board' do
      let(:expected_result) { [true, true, false] }

      before do
        allow(board_set).to receive(:defective_boards).and_return 1
        allow(board_set).to receive(:correct_identification_of_all_boards).and_return expected_result
      end

      it 'returns the status of each board' do
        expect(subject.test(:array_of_boards)).to eq expected_result
      end
    end

    context 'there are 2 defective boards' do
      let(:expected_result) { [true, false, true] }

      before do
        allow(board_set).to receive(:defective_boards).and_return 2
        allow(board_set).to receive(:correctly_identify_one_faulty_board).and_return expected_result
      end

      it 'returns the status of each board' do
        expect(subject.test(:array_of_boards)).to eq expected_result
      end
    end

    context 'there is one defective board' do
      let(:expected_result) { [true, true, false] }


      before do
        allow(board_set).to receive(:defective_boards).and_return 0
        allow(board_set).to receive(:incorrectly_identify_one_working_board_as_faulty).and_return expected_result
      end

      it 'returns the status of each board' do
        expect(subject.test(:array_of_boards)).to eq expected_result
      end
    end
  end
end
