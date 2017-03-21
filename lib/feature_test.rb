require './lib/oystercard'

card = Oystercard.new
card.top_up(20)
card.touch_in("Bank")
card.in_journey?
card.touch_out
card.in_journey?

# In order to pay for my journey
# As a customer
# I need to know where I've travelled from
card.touch_in
<station>
card
<station>
