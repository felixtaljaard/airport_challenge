require 'airport'

describe Airport do
    subject(:airport) {described_class.new(20)}
    let(:plane) {double :plane}

    describe '#land' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end
      it 'instructs a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end
      
      context 'when full' do
        it 'raises an error' do
          plane = double :plane
          20.times do
            airport.land(plane)
          end
          expect {airport.land(plane)}.to raise_error 'Cannot land plane as capacity is full'
          end
      end
    end
      
    context 'when stormy do'
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
      end
    end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end
    context 'when stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return true
      it 'raises an error' do
        expect { airport.land(plane) }.to raise_error 'Cannot take off plane: weather is stormy'
      end
    end
  end
end
end
end