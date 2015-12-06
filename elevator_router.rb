#why doesn't binding.pry work??
require_relative "elevator"

class ElevatorRouter
  attr_reader :top_floor, :bottom_floor

  def initialize(top_floor, bottom_floor = 1, elevator_count = 1)
    @bottom_floor = bottom_floor
    @top_floor = top_floor
    @elevators = create_elevators(elevator_count)
  end

  # returns hash with {elevator_index: location} 
  def elevator_locations
    @elevators.each_with_object({}).with_index do |(elevator, memo), index|
      memo[index] = elevator.current_floor
    end
  end

  def move
    @elevators.each{|e| e.move}
  end

  def add_destination(floor_num, elevator_num = nil)
    @elevators.first.add_destination(floor_num)
  end

  def elevator_count
    @elevators.count
  end

  private

  def create_elevators(elevator_count)
    (1..elevator_count).map do 
      Elevator.new(@top_floor, @bottom_floor) 
    end
  end

end
