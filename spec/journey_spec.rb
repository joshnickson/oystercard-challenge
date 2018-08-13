require './lib/journey'
require './lib/oystercard'


describe Journey do
  let(:card) {OysterCard.new}
  let(:station) { Station.new('Aldgate', 1) }
  let(:commute) { Journey.new(card) }

  it 'tells you when in journey' do
    card.top_up(50)
    card.touch_in(station)
    expect(commute).to be_in_journey
  end

  it 'returns minimum fare' do
      expect(commute.fare).to eq 1
  end

end
