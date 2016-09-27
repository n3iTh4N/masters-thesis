class TeachersController < ApplicationController
	def index
		@teacher = Teacher.find(1)
	end
end