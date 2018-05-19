require 'Garage'

describe Garage do
	it 'loads' do
		expect(subject).to respond_to (:load)
	end

	it 'unloads' do
		expect(subject).to respond_to (:unload)
	end
end