class GamesController < ApplicationController
	def index
		@game = Game.find(1)
	end
end