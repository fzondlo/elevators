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

  def call_to(floor_num, direction)
    if @destinations.any? and 
        floor_num.between?(@current_floor,last_stop_in_current_direction)
      add_destination_and_prioritize(floor_num)
    else
      add_destination(floor_num)
    end
  end

  private

  def add_destination_and_prioritize(floor_num)
    if @destinations.count == 1
      @destinations.unshift floor_num
      return
    end

    stops_in_direction = @destinations.slice(0,@destinations.index(last_stop_in_current_direction)+1)
    insert_at_index = find_insert_idx(stops_in_direction, floor_num)
    @destinations.insert(insert_at_index, floor_num)
  end

  def find_insert_idx(ary, n)
    is_asc = (ary.sort == ary)
    if (is_asc)
      return ary.index { |i| i > n }
    else 
      return ary.index { |i| i < n }
    end
  end

  def last_stop_in_current_direction
    return next_stop if @destinations.count == 1
    if up? 
      @destinations[0..-2].each_with_index do |destination, i|
        return destination if destination > @destinations[i.next]
      end
    else
      @destinations[0..-2].each_with_index do |destination, i|
        return destination if destination < @destinations[i.next]
      end
    end
    @destinations.last
  end

  def up?
    next_stop > current_floor
  end

  def at_destination?
    @current_floor == next_stop
  end

end