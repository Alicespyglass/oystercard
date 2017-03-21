class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
    @in_transit = false
  end

  def top_up(amount)
    fail "Top up unsuccessful, balance cannot exceed limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_transit = true
  end

  def in_journey?
    @in_transit
  end

  def touch_out
    @in_transit = false
  end

end
