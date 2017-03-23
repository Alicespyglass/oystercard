require './lib/journey'
require './lib/oystercard'

card = Oystercard.new
card.top_up(20)
card.touch_in("Leyton")
card.touch_out("Leyton")
card.balance
card.touch_out("Bank")
card.journey_log


# I need a penalty charge deducted if I fail to touch in or out

Create journey class
