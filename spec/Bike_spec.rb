require 'Bike'
describe Bike do
 it "responds to working?" do
   is_expected.to respond_to(:working?)
 end
 it "can be broken" do
   subject.working = false
   expect(subject.working?).to eq false
 end

end
