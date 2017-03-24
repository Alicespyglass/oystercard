require 'journeylog'

# Class responsibility:
# - starting a journey
# - ending a journey
# - returning a list of journeys
# creates Journey class (object) when it starts

describe Journeylog do
  let(:journey) { double :journey }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

  let(:journey_class) { double :journey_class, new: journey}
  subject(:journeylog) { described_class.new}

  it { is_expected.to respond_to(:start_station).with(1).argument }


  describe '#start_station' do
    it 'starts a journey' do
      expect(journey_class).to receive(:new).with(entry_station: entry_station)
      journeylog.start_station(entry_station)
    end

  #   it describe 'add entry_station to current_journey' do
  #     journeylog.start_station(entry_station)
  #     expect(journeylog.entry_station).to eq entry_station
  #   end
  end


end