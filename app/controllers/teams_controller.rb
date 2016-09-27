class TeamsController < ApplicationController
	def index
		@team = Team.find(1)
	end
end