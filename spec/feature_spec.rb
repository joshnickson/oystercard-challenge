require './lib/oystercard'
require './lib/journey'

card = OysterCard.new
card.top_up(10)

aldgate = Station.new('Aldgate', 1)
monument = Station.new('Monument', 1)

card.touch_in(aldgate)
card.touch_out(monument)

journey = Journey.new(card)
journey.fare
