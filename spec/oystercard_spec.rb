require './lib/oystercard.rb'

describe Oystercard do
  let(:card) { Oystercard.new }

  it 'new card has balance of zero' do
    expect(card.balance).to eq 0
  end

  it 'tops up card with amount' do
    expect(card.top_up(20)).to eq 20
  end

end
