require './lib/journey'
require './lib/oystercard'

card = Oystercard.new
card.top_up(20)
card.touch_out("Leyton")
card.balance

card.in_journey?
card.touch_in("Liverpool Street")



# I need a penalty charge deducted if I fail to touch in or out

Create journey class
