class Journey

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
