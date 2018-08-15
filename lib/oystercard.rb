require_relative 'station'

class OysterCard
  attr_reader :balance, :entry_station, :exit_station, :journey_log

  MAX_AMOUNT = 90

  def initialize
    @balance = 0
    @journey_log = []
  end

  def top_up(amount)
    value = @balance + amount
    raise "Cannot exceed #{MAX_AMOUNT}" if value > MAX_AMOUNT
    @balance += value
  end

  def touch_in(station)
    raise 'not enough money mate' if @balance < 1
    if Journey.new(self).in_journey?
      penalty
      complete_journey
    end
    @entry_station = station.name
  end

  def touch_out(station)
    penalty unless Journey.new(self).in_journey?
    @exit_station = station.name
    complete_journey
  end

  def complete_journey
    deduct(@penalty)
    @journey_log << [@entry_station, @exit_station]
    @entry_station = nil
    @exit_station = nil
    @penalty = false
  end

  def penalty
    @penalty
  end

  private

  def deduct(penalty)
    @balance -= Journey::JOURNEY_COST
    @balance -= 6 if penalty
    @balance
  end

end
