require './lib/oystercard'

card = Oystercard.new
card.top_up(20)
card.touch_in("Bank")
card.in_journey?
card.touch_out
card.in_journey?


card.history
#I want to see to all my previous trips
