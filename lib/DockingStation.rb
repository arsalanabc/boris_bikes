 require_relative 'Bike.rb'
class DockingStation
  attr_reader :bike
  def initialize
    @bike = Bike.new
  end
  def release_bike
    bikehold = @bike
    raise "no bike to be released" unless @bike
    @bike = nil
    return bikehold

  end

  def dock_bike(bike)
    raise "can't have 2 bikes" if @bike
    @bike = bike
  end

end
