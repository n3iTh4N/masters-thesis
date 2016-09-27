class Teacher < ActiveRecord::Base
	has_many :students
	has_many :lobbies
	has_many :games, through: :lobbies
end
