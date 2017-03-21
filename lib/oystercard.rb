class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_TRAVEL_BALANCE = 1

  attr_reader :balance, :fare, :history

  def initialize(fare=MINIMUM_TRAVEL_BALANCE)
    @balance = 0
    @in_transit = false
    @fare = fare
    @history = []
  end

  def top_up(amount)
    fail "Top up unsuccessful, balance cannot exceed limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds. £1 minimum needed to travel." if @balance < MINIMUM_TRAVEL_BALANCE
    @in_transit = true
    @history << station
  end

  def in_journey?
    @in_transit
  end

  def touch_out
    @in_transit = false
    deduct(fare)
  end

  private

  attr_writer :deduct, :balance

  def deduct(fare)
    @balance -= fare
  end


end
