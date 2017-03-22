require './lib/oystercard'

card = Oystercard.new
card.top_up(20)
card.touch_in("Bank")
card.touch_out("exit station")
card.journey_log






card.journey_log
#I want to see to all my previous trips
# need an exit station
# need to create exit station as a key
# need to create entry station as a key in the journey log hash
# touch out needs to take exit station as an argument
