require './lib/oystercard.rb'

describe OysterCard do
  let(:card) { OysterCard.new }

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
    expect(card.deduct(5)).to eq 75
  end

  it 'touches in' do
    card.top_up(50)
    expect(card.touch_in).to eq true
  end

  it 'tells you when in journey' do
    card.top_up(50)
    card.touch_in
    expect(card).to be_in_journey
  end

  it 'touches out' do
    expect(card.touch_out).to eq false
  end

  it 'raises error if touch in amount is less than 1' do
    expect { card.touch_in }.to raise_error 'not enough money mate'
  end

end
