require 'Bike'
describe Bike do
 it "responds to working?" do
   is_expected.to respond_to(:working?)
 end
end
