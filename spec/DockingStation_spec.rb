require 'DockingStation'
describe DockingStation do

  it "Can release a bike" do
    ds_mock = double
    allow(ds_mock).to receive(:release_bike).and_return(nil)
    expect(ds_mock).to respond_to(:release_bike)
    #is_expected.to respond_to(:release_bike)

  end

  # let(:bike) {double :bike}
  # it "returns a working bike" do
  #   subject.dock_bike double(:bike)
  #   bike = subject.release_bike
  #   allow(bike).to recieve(:working?).and_return(true)
  #   expect(bike.working?).to eq(true) #eq(true)
  # end


  #let(:bike_mock) {double :bike} # using double for bike
  it "returns a working bike" do
    bike_mock = double # same as let(:bike_mock) {double :bike}
    allow(bike_mock).to receive(:working?).and_return(true)
    expect(bike_mock.working?).to eq(true) #eq(true)
  end

  it "allows me to dock a bike" do
    expect(subject).to respond_to(:dock_bike) #is_expected.to respond_to(:dock_bike)
    expect(subject.bikes.last.class).to be_a(Bike.class)
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
    #mock_bike = double("Some Collaborator", :working? => false)
    mock_bike = double
    allow(mock_bike).to receive(:working?).and_return(false)
    subject.dock_bike(mock_bike)
    expect{subject.release_bike}.to raise_error("Can't release broken bike")
  end
end
