require './lib/oystercard.rb'

describe Oystercard do
  it 'new card has balance of zero' do
    expect(subject.balance).to eq 0
  end
end
