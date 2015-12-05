class Elevator
  attr_reader :current_floor, :bottom_floor, :top_floor

  def initialize(top_floor, bottom_floor = 1, current_floor = 1)
    @current_floor = current_floor
    @bottom_floor = bottom_floor
    @top_floor = top_floor
    @destinations = []
  end

  def next_stop
    @destinations.first
  end

  def add_destination(floor_num)
    @destinations << floor_num
  end

  #moves elevator and returns current floor
  def move
    return if next_stop.nil?
    return @destinations.shift if at_destination?

    if next_stop > @current_floor
      @current_floor += 1
    else
      @current_floor -= 1
    end

    @current_floor
  end

  private

  def at_destination?
    @current_floor == next_stop
  end

end