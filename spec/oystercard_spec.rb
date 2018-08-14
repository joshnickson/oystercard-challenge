require './lib/oystercard.rb'

describe OysterCard do
  let(:card) { OysterCard.new }
  let(:station) { Station.new('Aldgate', 1) }

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
    expect(card.send(:deduct, 5)).to eq 75
  end

  describe '#touch_in' do

    it 'touches in' do
      card.top_up(50)
      expect(card.touch_in(station)).to eq station.name
    end

  end

  it 'touches out and deducts the cost of the journey' do
    expect{card.touch_out(station)}.to change{card.balance}.by(-1)
  end

  it 'raises error if touch in amount is less than 1' do
    expect { card.touch_in(station) }.to raise_error 'not enough money mate'
  end

end
