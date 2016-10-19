class TeachersController < ApplicationController
	def index
		@teacher = Teacher.find(1)
	end

	def increategame
		@questions = Question.order('id ASC')
	end

	def increatelobby
		@xx = "up tomorrow, it's a rainy day"
	end
end
