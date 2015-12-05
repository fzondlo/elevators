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

  def move
    return if next_stop.nil?



  end

end

=begin
  attr_reader :status, :direction, :current_floor, :next_stop

  def initialize(current_floor, )
  end

  def move_elevator
    
  end

  def next_floor
  end

  def call_from(floor, priority = false)
  end

  def is_on_route?(floor_num)
  end

  #private
  
  def remove_floor
  end

  def busy?
    #if 

  end

  def set_direction(direction)

  end

end

=end