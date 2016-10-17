class TeachersController < ApplicationController
	def index
		@teacher = Teacher.find(1)
	end

	def increategame
		@x = "hey hey hey up tomorrow"
	end

	def increatelobby
		@xx = "up tomorrow, it's a rainy day"
	end
end
