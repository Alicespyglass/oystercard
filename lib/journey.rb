class Journey

attr_reader :entry_station, :exit_station
MINIMUM_TRAVEL_BALANCE = 1
PENALTY_FARE = 6


def initialize
  @entry_station = nil
  @exit_station = nil
end

def start(entry_station)
  @entry_station = entry_station
end


def end(exit_station)
  @exit_station = exit_station
end


def fare
  if @entry_station == nil
    PENALTY_FARE
  else
    MINIMUM_TRAVEL_BALANCE
  end
end


end
