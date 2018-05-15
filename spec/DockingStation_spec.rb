require 'DockingStation'
describe DockingStation do
  it "Can release a bike" do
    is_expected.to respond_to(:release_bike)
  end

  it "returns a working bike" do
    bike = subject.release_bike
    expect(bike.working?).to eq(true) #eq(true)
  end
  it "allows me to dock a bike" do
    subject.release_bike
    is_expected.to respond_to(:dock_bike)
    subject.dock_bike(Bike.new)
    expect(subject.bikes.last).to be_a(Bike)
  end
  it "returns an error when trying to get bike if empty" do
    subject.capacity.times{subject.release_bike}
    expect{subject.release_bike}.to raise_error("no bike to be released")
  end
  it "returns an error when trying to add a bike if one already exists" do
    expect{subject.dock_bike(Bike.new)}.to raise_error("can't have 20 bikes")
  end
  it "Starts with 20 bikes when no other option given" do
    expect(subject.bikes.length).to eq subject.capacity
  end
  it "Starts with 3 tests when 3 passed in" do
    a = DockingStation.new(3)
    expect(a.bikes.length).to eq 3
  end
  it "Should not release a broken bike" do
    subject.bikes[-1].working = false
    expect{subject.release_bike}.to raise_error("Can't release broken bike")
  end
end
