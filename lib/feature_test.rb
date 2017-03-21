require './lib/oystercard'

card = Oystercard.new
card.top_up(20)
card.touch_in

#When my journey is complete,
#I need the correct amount deducted from my card
card.touch_out
card.balance
