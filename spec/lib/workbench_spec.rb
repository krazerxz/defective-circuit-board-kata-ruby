require 'spec_helper'

describe Workbench do
  let(:circuit_boards) { BoardGenerator.new_set }
  subject              { described_class.new(circuit_boards) }

  it 'returns the cards that are faulty' do
    faulty_circuit_boards = circuit_boards.reject(&:working?)
    expect(subject.bad_cards).to eq faulty_circuit_boards
  end
end
