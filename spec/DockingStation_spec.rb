require 'DockingStation'
describe DockingStation do
  it "Can release a bike" do
    is_expected.to respond_to(:release_bike)
  end

  it "returns a working bike" do
    subject.dock_bike(Bike.new)
    bike = subject.release_bike
    expect(bike.working?).to eq(true) #eq(true)
  end
  it "allows me to dock a bike" do
    is_expected.to respond_to(:dock_bike)
    subject.dock_bike(Bike.new)
    expect(subject.bikes.last).to be_a(Bike)
  end
  it "returns an error when trying to get bike if empty" do
    expect{subject.release_bike}.to raise_error("no bike to be released")
  end
  it "returns an error when trying to add a bike if one already exists" do
    subject.capacity.times{subject.dock_bike(Bike.new)}
    expect{subject.dock_bike(Bike.new)}.to raise_error("can't have 20 bikes")
  end
  it "Starts with 20 capacity when no other option given" do
    expect(subject.capacity).to eq $DEFAULT_CAPACITY
  end
  it "Starts with 3 capactiy when 3 passed in" do
    a = DockingStation.new(3)
    expect(a.capacity).to eq 3
  end
  it "Should not release a broken bike" do
    subject.dock_bike(Bike.new)
    subject.bikes[-1].working = false
    expect{subject.release_bike}.to raise_error("Can't release broken bike")
  end
end
