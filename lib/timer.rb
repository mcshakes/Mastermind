class Timer
  attr_reader :start_time

  def initialize
    @start_time = Time.new
  end

  def end_time
    Time.now
  end

  def minutes
    timer / 60
  end

  def seconds
    timer % 60
  end

  def timer
    (end_time - @start_time).to_i
  end
end
