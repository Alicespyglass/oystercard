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
