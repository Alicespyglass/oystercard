require 'journey'

describe Journey do


let(:entry_station) { double :station}
let(:exit_station) { double :station}
subject(:journey) { described_class.new }

it { is_expected.to respond_to(:start).with(1).argument }
it { is_expected.to respond_to(:end).with(1).argument }
it { is_expected.to respond_to(:fare) }

  describe '#start' do
    it 'stores an entry_station' do
      journey.start(entry_station)
      expect(journey.entry_station).to eq entry_station
    end
  end

  describe '#end' do
    it 'stores an exit_station' do
      journey.end(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
  end

  describe '#fare' do
    it 'charges the minimum balance for a journey' do
      journey.start(entry_station)
      journey.end(exit_station)
      expect(journey.fare).to eq Journey::TRAVEL_FARE
    end

    it 'charges a penalty fare if exit but no entry' do
     journey.end(exit_station)
     expect(journey.fare).to eq Journey::PENALTY_FARE
    end
    it 'charges a penalty fare if entry but no exit' do
     journey.start(entry_station)
     expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#finish' do
    it 'resets entry and exit stations' do
      journey.start(entry_station)
      journey.end(exit_station)
      journey.finish
      expect(journey.completed?).to eq false
    end

  end


end
