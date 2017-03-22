require_relative 'station'
require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_TRAVEL_BALANCE = 1

  attr_reader :balance, :fare, :entry_station, :journey_log, :journey, :min_balance

  def initialize(fare= MINIMUM_TRAVEL_BALANCE)
    @balance = 0
    @fare = fare
    @entry_station = nil
    @journey_log = []
  end

  def top_up(amount)
    fail "Top up unsuccessful, balance cannot exceed limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds. £1 minimum needed to travel." if @balance < MINIMUM_TRAVEL_BALANCE
    @journey = Journey.new
    journey.start(station)
  end

  def in_journey?
    journey.entry_station != nil && journey.exit_station == nil
  end

  def touch_out(exit_station)
    journey.end(exit_station)
    @journey_log << { entry_station: journey.entry_station, exit_station: journey.exit_station }
    deduct(journey.fare)
  end

  private

  attr_writer :deduct, :balance, :journey

  def deduct(fare)
    @balance -= fare
  end


end
