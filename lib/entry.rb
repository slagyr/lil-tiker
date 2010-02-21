class Entry

  attr_reader :time, :activity

  def initialize(activity)
    @activity = activity
    @time = Time.now
  end

  def to_s
    return "#{@time}:\t#{@activity}"
  end

end