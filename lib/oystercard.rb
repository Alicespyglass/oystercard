class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_TRAVEL_BALANCE = 1

  attr_reader :balance, :fare, :entry_station, :journey_log

  def initialize(fare=MINIMUM_TRAVEL_BALANCE)
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
    @entry_station = station
  end

  def in_journey?
    !!@entry_station
  end

  def touch_out
    @journey_log << @entry_station
    @entry_station = nil
    deduct(fare)
  end

  private

  attr_writer :deduct, :balance

  def deduct(fare)
    @balance -= fare
  end


end
