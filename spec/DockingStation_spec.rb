require 'DockingStation'
describe DockingStation do
  it "Can release a bike" do
    is_expected.to respond_to(:release_bike)
  end
end
