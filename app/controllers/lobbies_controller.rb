class LobbiesController < ApplicationController

	before_action :authenticate_student!

	def index
		@lobby = Lobby.find(1)

		# reset lobby ID of current_student
		current_student.lobby_id = 0
		current_student.save
		Student.where(id: current_student.id).update_all(team_id: 0)
    Student.where(id: current_student.id).update_all(player_number: 0)
		Student.where(id: current_student.id).update_all(game_id: 0)
	end

	def inlobby
		# set student lobby_id to lobby_id of clicked lobby

		current_student.lobby_id = params[:lobby_id]
		Student.where(id: current_student.id).update_all(lobby_id: params[:lobby_id])

		# load the game that the lobby was set to have by the teacher
		@game_to_play = Game.find(params[:lobby_id])
		Student.where(id: current_student.id).update_all(game_id: @game_to_play.id)
	end

	def ingame

		# @qs = '{"names":["Africa","America", "Asia", "Australia"],"street":"Oslo West 16","phone":"555 1234567"}'
		# @qsj = JSON.parse(@qs)
		# @qsjl = @qsj.length
		# initialize everything
		@game_to_play = params[:game]
		@series = 1

	end

end
