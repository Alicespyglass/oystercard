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
  let(:current_journey) { double :current_journey, :start => entry_station , :end => exit_station}

  subject(:journeylog) { described_class.new }

  before do
    allow(current_journey).to receive(:start).with(anything)
  end

  it { is_expected.to respond_to(:start_station).with(1).argument }


  describe '#start_station' do
    it 'starts a journey' do
      journeylog.create_journey
      expect(journeylog.current_journey).to receive(:start).with(entry_station)
      journeylog.start_station(entry_station)
    end

    # describe '#create_journey' do
    #   it 'creates a journey' do
    #     journeylog.create_journey
    #     expect(journeylog.current_journey).to receive :start
    #   end
    # end

  #   it describe 'add entry_station to current_journey' do
  #     journeylog.start_station(entry_station)
  #     expect(journeylog.entry_station).to eq entry_station
  #   end
  end

  describe '#finish_station' do
    it 'ends a journey' do
      journeylog.create_journey
      journeylog.start_station(entry_station)
      expect(journeylog.current_journey).to receive(:end).with(exit_station)
      journeylog.finish_station(exit_station)
    end

    it 'stores a finished journey' do
      journeylog.create_journey
      journeylog.start_station(entry_station)
      journeylog.finish_station(exit_station)
      expect(journeylog.journey_history).to eq [ {entry_station: entry_station, exit_station: exit_station}]
    end

  end


end
