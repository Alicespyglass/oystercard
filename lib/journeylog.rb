# Class responsibility:
# - starting a journey
# - ending a journey
# - returning a list of journeys
# creates Journey class (object) when it starts

class Journeylog
require_relative 'journey'

  attr_reader :journey_class, :entry_station, :journey_history, :current_journey

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journey_history = []
  end

  def start_station(entry_station)
    @current_journey = @journey_class.new
    @current_journey.start(entry_station)
    @entry_station = entry_station
  end

  private

  attr_writer :journey_class
end
