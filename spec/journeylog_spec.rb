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
  subject(:journeylog) { described_class.new(journey_class: journey_class)}









end
