class Journey

  JOURNEY_COST = 1

  def initialize(oystercard)
    @oystercard = oystercard
  end

  def in_journey?
    @oystercard.entry_station != nil
  end

  def fare
    1
  end

end
