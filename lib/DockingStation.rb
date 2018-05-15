 require_relative 'Bike.rb'
class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
    20.times do
      @bikes << Bike.new
    end
  end
  def release_bike
    raise "no bike to be released" if empty?
    return @bikes.pop
  end

  def dock_bike(bike)
    raise "can't have 20 bikes" if full?
    @bikes << bike
  end

  private

  def full?
    return true if @bikes.length == 20
    return false
  end

  def empty?
    return @bikes.empty?
  end
end
