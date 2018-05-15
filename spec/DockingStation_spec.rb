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
    expect(subject.bike).to be_a(Bike)
  end
  it "returns an error when trying to get bike if empty" do
    subject.release_bike
    expect{subject.release_bike}.to raise_error
  end
end
