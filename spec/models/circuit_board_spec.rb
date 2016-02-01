require 'spec_helper'

describe CircuitBoard do
  subject { described_class.new(working: true) }

  describe 'working?' do
    it 'returns true if the circuit board works' do
      expect(subject.working?).to be true
    end
  end
end
