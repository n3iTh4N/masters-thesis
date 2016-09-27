class Team < ActiveRecord::Base
	has_many :students
	belongs_to :game
	belongs_to :lobby
end
