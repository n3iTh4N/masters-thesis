class Student <  ActiveRecord::Base

  belongs_to :teacher, optional: true
  belongs_to :lobby, optional: true
	belongs_to :team, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
