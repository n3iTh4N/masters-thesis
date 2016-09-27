class Game < ActiveRecord::Base
	has_many :lobbies
	has_many :teams
	has_many :students, through: :teams
	has_many :teachers, through: :lobby
end
