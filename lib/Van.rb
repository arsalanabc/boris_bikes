class Van

 	attr_reader :bikes, :broken_bikes, :working_bikes, :dockingstation

 	def initialize(dockstation = nil)
# 		@broken_bikes @working_bikes = []
		@bikes = []
		@dockingstation = dockstation
 	end

# 	# load a bike to van
	def load(bike)
# 		@broken_bikes.push(bike) unless bike.working?
# 		@working_bikes.push(bike) if bike.working?
		@bikes << bike
	end

# 	# unload a bike to van
 	def unload
 		
 		@bikes

	end
end

