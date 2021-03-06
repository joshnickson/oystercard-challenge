require './lib/oystercard.rb'

describe OysterCard do
  let(:card) { OysterCard.new }
  let(:aldgate) { Station.new('Aldgate', 1) }
  let(:monument) { Station.new('Monument', 1) }

  it 'new card has balance of zero' do
    expect(card.balance).to eq 0
  end

  it 'tops up card with amount' do
    expect(card.top_up(20)).to eq 20
  end

  it 'has a maximum value of 90' do
    expect { card.top_up(100) }.to raise_error(RuntimeError, "Cannot exceed 90")
  end

  it 'deducts an amount' do
    card.top_up(80)
    expect(card.send(:deduct, false)).to eq 79
  end

  describe '#touch_in' do

    it 'touches in' do
      card.top_up(50)
      expect(card.touch_in(aldgate)).to eq aldgate.name
    end

  end

  it 'touches out and deducts the cost of the journey' do
    card.top_up(50)
    card.touch_in(monument)
    expect{card.touch_out(aldgate)}.to change{card.balance}.by(-1)
  end

  it 'raises error if touch in amount is less than 1' do
    expect { card.touch_in(aldgate) }.to raise_error 'not enough money mate'
  end

  it 'gives you a list of journey history' do
    card.top_up(50)

    card.touch_in(aldgate)
    card.touch_out(monument)

    card.touch_in(monument)

    card.touch_in(monument)
    card.touch_out(aldgate)

    expect(card.journey_log.flatten.join', ').to eq 'Aldgate, Monument, Monument, , Monument, Aldgate'

  end

end
