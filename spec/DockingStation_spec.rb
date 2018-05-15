require 'DockingStation'
describe DockingStation do
  it "Can release a bike" do
    is_expected.to respond_to(:release_bike)
  end
  it "returns a working bike" do
    bike = subject.release_bike
    expect(bike.working?).to eq(true) #eq(true)
  end
end
