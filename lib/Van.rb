class Van

 	attr_reader :broken_bikes, :working_bikes, :dockingstation,
 	:garage

 	def initialize(dockstation = nil, garage = nil)
 		@broken_bikes = []
	  	@working_bikes = []
		@dockingstation = dockstation
		@garage = garage
 	end

# 	# load a bike to van
	def load(bike)
 		@broken_bikes << bike unless bike.working?
 		@working_bikes << bike if bike.working?
		
	end

# 	# unload a bike to van
 	def unload
 		return @broken_bikes  unless @garage.nil?
 		return @working_bikes unless @dockingstation.nil?	

	end
end
