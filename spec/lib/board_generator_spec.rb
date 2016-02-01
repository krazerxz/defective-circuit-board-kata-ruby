require 'spec_helper'

describe BoardGenerator do
  describe 'new_set' do
    it 'returns an array of 10 circuit boards, 2 of which are faulty, in a random order' do
      boards = BoardGenerator.new_set
      expect(boards.count).to eq 10
      expect(boards.count(&:working?)).to eq 8

      new_boards = BoardGenerator.new_set
      expect(boards.map(&:working?)).not_to eq new_boards.map(&:working?)
    end
  end
end
