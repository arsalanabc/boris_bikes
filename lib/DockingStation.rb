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
    raise "no bike to be released" if @bikes.empty?
    return @bikes.pop
  end

  def dock_bike(bike)
    raise "can't have 20 bikes" if @bikes.size == 20
    @bikes << bike
  end

end
