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
    is_expected.to respond_to(:dock_bike)
    subject.dock_bike(Bike.new)
    expect(subject.bikeDocked).to eq(true)
  end
end
