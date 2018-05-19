class Van

 	attr_reader :bikes, :broken_bikes, :working_bikes, :dockingstation,
 	:garage

 	def initialize(dockstation = nil, garage=nil)
 		@broken_bikes = []
	  	@working_bikes = []
		@bikes = []
		@dockingstation = dockstation
		@garage = garage
 	end

# 	# load a bike to van
	def load(bike)
 		@broken_bikes << bike unless bike.working?
 		@working_bikes << bike if bike.working?
		@bikes << bike
	end

# 	# unload a bike to van
 	def unload
 		@broken_bikes  unless @garage.nil?
 		@working_bikes unless @dockstation.nil?
 		@bikes

	end
end

