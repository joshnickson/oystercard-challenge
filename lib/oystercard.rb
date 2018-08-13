require_relative 'station'

class OysterCard
  attr_reader :balance
  attr_reader :entry_station

  MAX_AMOUNT = 90
  JOURNEY_COST = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    value = @balance + amount
    raise "Cannot exceed #{MAX_AMOUNT}" if value > MAX_AMOUNT
    @balance += value
  end

  def touch_in(station)
    raise 'not enough money mate' if @balance < 1
    @entry_station = station.name
  end

  def touch_out
    self.deduct
    @entry_station = nil
  end


#  private

  def deduct(amount = JOURNEY_COST)
    @balance -= amount
  end

end
