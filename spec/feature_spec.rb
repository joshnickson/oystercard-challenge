require './lib/oystercard'

card = OysterCard.new
card.top_up(10)
card.touch_in('Aldgate')
