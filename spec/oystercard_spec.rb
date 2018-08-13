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
    expect(card.touch_in).to eq true
  end

  it 'tells you when in journey' do
    card.touch_in
    expect(card.in_journey?).to eq true
  end

  it 'touches out' do
    expect(card.touch_out).to eq false
  end

end
