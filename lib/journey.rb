class Journey

attr_reader :entry_station, :exit_station
TRAVEL_FARE = 1
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
  if completed?
    TRAVEL_FARE
  else
    PENALTY_FARE
  end
end

def finish
  @entry_station = nil
  @exit_station = nil
end



private
attr_writer :entry_station, :exit_station

def completed?
  entry_station != nil && exit_station != nil
end

end
