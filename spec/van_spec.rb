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
			expect(subject.bikes.last).to be_working
		end

		it "loads non working bike" do
			allow(m_bike).to receive(:working?).and_return(false)
			subject.load(m_bike)
			expect(subject.bikes.last).not_to be_working
		end

		it "loads multiple bikes" do
			20.times{ subject.load(mock_bike) }
			expect(subject.bikes.count).to eq 20
		end

		it "unloads bikes" do
			mock_bikes = Array.new(10, mock_bike)
			mock_bikes.each { subject.load(mock_bike) }
			expect(subject.unload).to eq mock_bikes
		end

 	end
 	

 	describe 'un/loading at dockingStation' do

 		it 'unloads to dockingStation' do
 			#arrange
 			mock_bikes = Array.new(10,mock_bike)
 			
 			#act
 			van = Van.new(mock_dockStation)
 			mock_bikes.each{|m_bike| van.load(m_bike) }
 			
 			#arrange
 			allow(m_ds).to receive(:bikes).and_return(van.unload)
 			
 			#assert
 			expect(m_ds.bikes).to eq mock_bikes
 		end

 		it 'loads from dockingStation' do
 			#arrange
 			mock_bikes = Array.new(10,mock_bike)
 			allow(m_ds).to receive(:bikes).and_return(mock_bikes)
 			#act
 			subj = Van.new(m_ds)
 			subj.dockingstation.bikes.each do |bike|
 				subj.load(bike)
 			end

 			#assert
 			expect(subj.bikes).to eq mock_bikes
 		end
 	end

 	describe 'un/loading at garage' do
 		it 'unloads to garage' do
 			#arrange
 			mock_bikes = Array.new(10,mock_bike)
 			
 			#act
 			van = Van.new(nil, m_garage)
 			mock_bikes.each{|m_bike| van.load(m_bike) }
 			
 			#arrange
 			allow(m_garage).to receive(:bikes).and_return(van.unload)
 			
 			#assert
 			expect(m_garage.bikes).to eq mock_bikes
 		end

 		it 'loads from garage' do
 			#arrange
 			mock_bikes = Array.new(10,mock_bike)
 			allow(m_garage).to receive(:bikes).and_return(mock_bikes)
 			#act
 			subj = Van.new(nil,  m_garage)
 			subj.garage.bikes.each do |bike|
 				subj.load(bike)
 			end

 			#assert
 			expect(subj.bikes).to eq mock_bikes
 		end
 		
 	end
end