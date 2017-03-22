class Journey

attr_reader :entry_station, :exit_station

def start(entry_station)
  @entry_station = entry_station
end


def end(exit_station)
  @exit_station = exit_station
end


def fare
end


end
