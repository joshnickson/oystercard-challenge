
require 'station'
describe Station do

  let(:station) { Station.new("Aldgate", 1)}
  it 'tells you the zone' do
    expect(station.zone).to eq 1
  end
end
