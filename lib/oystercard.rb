class OysterCard
  attr_reader :balance
  MAX_AMOUNT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    value = @balance + amount
    raise "Cannot exceed #{MAX_AMOUNT}" if value > MAX_AMOUNT
    @balance += value
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
