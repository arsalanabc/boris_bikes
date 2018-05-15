 require_relative 'Bike.rb'
class DockingStation
  attr_reader :bikes

  #put 20 bikes on the rack
  def initialize
    @bikes = []
    20.times do
      @bikes << Bike.new
    end
  end

  #take a bike off
  def release_bike
    raise "no bike to be released" if empty?
    return @bikes.pop
  end

  #dock a bike
  def dock_bike(bike)
    raise "can't have 20 bikes" if full?
    @bikes << bike
  end

  private
  #check if full
  def full?
    return @bikes.length == 20
  end

  #check if empty
  def empty?
    return @bikes.empty?
  end
end
