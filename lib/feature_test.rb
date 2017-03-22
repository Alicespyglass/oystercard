require './lib/journey'
require './lib/oystercard'

card = Oystercard.new
card.top_up(20)
card.touch_in("Leyton")
card.in_journey?
card.touch_out("Liverpool Street")
card.journey_log
card.balance



# I need a penalty charge deducted if I fail to touch in or out

Create journey class
