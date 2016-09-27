class Lobby < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :game
	has_many :students
	has_many :teams
end
