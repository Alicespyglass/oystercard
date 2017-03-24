require './lib/journey'
require './lib/oystercard'
require './lib/journeylog'

journeylog = Journeylog.new
journeylog.start_station('entry_station')
journeylog




card = Oystercard.new
card.top_up(20)
card.touch_in("Leyton")
card.touch_out("Leyton")
card.balance
card.touch_out("Bank")
card.journey_log


# I need a penalty charge deducted if I fail to touch in or out

Create journey class
