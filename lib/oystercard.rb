class OysterCard
  attr_reader :balance
  MAX_AMOUNT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    value = @balance + amount
    raise "Cannot exceed #{MAX_AMOUNT}" if value > MAX_AMOUNT
    @balance += value
  end

  def deduct(amount)
    @balance -= amount
  end

end
