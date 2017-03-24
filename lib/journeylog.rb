# Class responsibility:
# - starting a journey
# - ending a journey
# - returning a list of journeys
# creates Journey class (object) when it starts

class Journeylog
require_relative 'journey'

  attr_reader :journey_class, :journey_history, :current_journey

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journey_history = []
  end

  def start_station(entry_station)
    @current_journey.start(entry_station)
  end

  def create_journey
    @current_journey = @journey_class.new
  end

  def finish_station(exit_station)
    @current_journey.end(exit_station)
    @journey_history << {entry_station: current_journey.entry_station, exit_station: current_journey.exit_station} 
  end

  private

  attr_writer :journey_class
end
