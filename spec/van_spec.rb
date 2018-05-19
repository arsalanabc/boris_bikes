require "Van"

describe Van do
    let (:mock_bike) { double :bike }
    let (:mock_dockStation) { double :dockingStation } # not in use
    let (:mock_garage) { double :garage } # not is use
    let (:m_bike) { instance_double ('Bike')}
    let (:m_ds) { instance_double('DockingStation') }
    let (:m_garage) { instance_double('Garage') }

    it "instantiates a van class" do
		expect(subject.class).to be_a(Van.class)
	end

	it "responds to methods" do
		# responds to load methods
		expect(subject).to respond_to(:load)
		# responds to unload methods
		expect(subject).to respond_to(:unload)
	end

	describe 'loading bikes' do

		it "un/loads working bike" do
			allow(m_bike).to receive(:working?).and_return(true)
			subject.load(m_bike)
			expect(subject.working_bikes.last).to be_working
		end

		it "loads non working bike" do
			allow(m_bike).to receive(:working?).and_return(false)
			subject.load(m_bike)
			expect(subject.broken_bikes.last).not_to be_working
		end

		it "loads multiple bikes" do
			allow(m_bike).to receive(:working?).and_return(true)
			20.times{ subject.load(m_bike) }
			expect(subject.working_bikes.count).to eq 20
		end

		it "unloads bikes" do
			allow(m_bike).to receive(:working?).and_return(true)
			m_bikes = Array.new(10, m_bike)
			m_bikes.each { subject.load(m_bike) }
			expect(subject.working_bikes).to eq m_bikes

			allow(m_bike).to receive(:working?).and_return(false)
			m_bikes = Array.new(10, m_bike)
			m_bikes.each { subject.load(m_bike) }
			expect(subject.broken_bikes).to eq m_bikes
		end

 	end
 	

 	describe 'un/loading at dockingStation' do

 		it 'unloads to dockingStation' do
 			#arrange
 			m_bikes = Array.new(10, m_bike)
 			allow(m_bike).to receive(:working?).and_return(true)
 			
 			#act
 			van = Van.new(mock_dockStation)
 			m_bikes.each{|m_bike| van.load(m_bike) }
 			
 			#arrange
 			allow(m_ds).to receive(:bikes).and_return(van.unload)
 			
 			#assert
 			expect(m_ds.bikes).to eq m_bikes
 		end

 		it 'loads from dockingStation' do
 			#arrange
 			m_bikes = Array.new(10, m_bike)
 			allow(m_bike).to receive(:working?).and_return(false)
 			allow(m_ds).to receive(:bikes).and_return(m_bikes)
 			#act
 			subj = Van.new(m_ds)
 			subj.dockingstation.bikes.each do |bike|
 				subj.load(bike)
 			end

 			#assert
 			expect(subj.broken_bikes).to eq m_bikes
 		end
 	end

 	describe 'un/loading at garage' do
 		it 'unloads to garage' do
 			#arrange
 			m_bikes = Array.new(10, m_bike)
 			allow(m_bike).to receive(:working?).and_return(false)
 			
 			#act
 			van = Van.new(nil, m_garage)
 			m_bikes.each{|m_bike| van.load(m_bike) }
 			
 			#arrange
 			allow(m_garage).to receive(:bikes).and_return(van.unload)
 			
 			#assert
 			expect(m_garage.bikes).to eq m_bikes
 		end

 		it 'loads from garage' do
 			#arrange
 			m_bikes = Array.new(10, m_bike)
 			allow(m_bike).to receive(:working?).and_return(true)
 			allow(m_garage).to receive(:bikes).and_return(m_bikes)
 			#act
 			subj = Van.new(nil,  m_garage)
 			subj.garage.bikes.each do |bike|
 				subj.load(bike)
 			end

 			#assert
 			expect(subj.working_bikes).to eq m_bikes
 		end
 		
 	end
end