require 'Garage'

describe Garage do
	let (:m_bike) { instance_double('Bike') }
	it 'loads' do
		expect(subject).to respond_to (:load)
	end

	it 'unloads' do
		expect(subject).to respond_to (:unload)
	end

	it 'holds bikes'do
		m_bikes = Array.new(10, m_bike)
		m_bikes.each { |bike| subject.load(bike)  }
		expect(subject.bikes).to eq m_bikes
	end

	it 'return bikes'do
		m_bikes = Array.new(10, m_bike)
		m_bikes.each { |bike| subject.load(bike)  }
		bikes = subject.unload
		expect(bikes).to eq m_bikes
	end

end