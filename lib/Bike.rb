class Bike
  attr_writer :working

  def initialize
    @working = true
  end

  #check if working
  def working?
    return @working
  end

end
