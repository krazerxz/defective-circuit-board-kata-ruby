require 'spec_helper'

describe Workbench do
  let(:circuit_boards) { Board::Generator.new_set }
  subject              { described_class.new(circuit_boards) }

  it 'returns the cards that are faulty' do
    faulty_circuit_boards = circuit_boards.reject(&:working?).sort_by(&:object_id)
    my_answer = subject.bad_cards.sort_by(&:object_id)
    expect(my_answer).to eq faulty_circuit_boards
  end
end
