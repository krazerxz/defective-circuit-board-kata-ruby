require 'spec_helper'

describe CircuitBoard do
  subject { described_class.new(working: true) }

  describe 'inspect' do
    it 'returns object inspect string, less instance variables' do
      expect(subject.inspect).to eq("#<CircuitBoard:#{subject.object_id}>")
    end
  end

  describe 'working?' do
    it 'returns true if the circuit board works' do
      expect(subject.working?).to be true
    end
  end
end
