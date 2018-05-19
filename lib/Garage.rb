class Garage
	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def load(bike)
		@bikes << bike
	end

	def unload
		@bikes
		
	end
end
