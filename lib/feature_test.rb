require './lib/oystercard'

card = Oystercard.new
card.top_up(20)
card.balance
card.deduct(5)
card.balance

# I need my fare deducted from my card


# deduct fare from card
card.deduct(fare)

# later - calculate fare

# In order to get through the barriers.
# As a customer
# I need to touch in and out.
card.touch_in
card.touch_out

#check state of card in journey
card.in_journey?

#
