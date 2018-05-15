 require_relative 'Bike.rb'
class DockingStation
  attr_reader :bikeDocked, :bike
  @bikeDocked = false

  def release_bike
    return Bike.new
  end

  def dock_bike(bike)
    @bike = bike
    @bikeDocked = true
  end

end
