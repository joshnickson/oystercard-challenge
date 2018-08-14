require_relative 'station'

class OysterCard
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station

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
    # something if in_journey?
    raise 'not enough money mate' if @balance < 1
    @entry_station = station.name
  end

  def touch_out(station)
    # something unless in_journey?
    self.deduct
    @entry_station = nil
    @exit_station = station.name
  end


#  private

  def deduct(amount = JOURNEY_COST)
    @balance -= amount
  end

end
