class StudentsController < ApplicationController

	before_action :authenticate_student!, only: [:index]

	def index
		@student = Student.find(1)
	end
end