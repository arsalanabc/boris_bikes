require_relative 'Bike.rb'
# creating a DockingStation class#
class DockingStation

  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  # put 20 bikes on the rack#
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  # take a bike off#
  def release_bike
    raise 'no bike to be released' if empty?
    raise "Can't release broken bike" unless @bikes.last.working?
    @bikes.pop
  end

  # dock a bike#
  def dock_bike(bike)
    raise "can't have 20 bikes" if full?
    @bikes << bike
  end

  private

  # check if full#
  def full?
    @bikes.length == @capacity
  end

  # check if empty#
  def empty?
    @bikes.empty?
  end
end
