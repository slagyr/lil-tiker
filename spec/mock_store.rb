class MockStore

  attr_reader :entries

  def initialize
    @entries = []
  end

  def enter(activity)
    @entries << activity
  end

end