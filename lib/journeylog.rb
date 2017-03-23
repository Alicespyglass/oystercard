# Class responsibility:
# - starting a journey
# - ending a journey
# - returning a list of journeys
# creates Journey class (object) when it starts

class Journeylog
require_relative 'journey'

  def ininialize(journey_class:)
    @journeys = []
    @journey_class = journey_class
  end

  

end
