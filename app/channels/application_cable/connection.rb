module ApplicationCable
  class Connection < ActionCable::Connection::Base
  identified_by :current_student

  def connect
  	self.current_student = find_verified_user
  	logger.add_tags 'ActionCable', current_student.email
  end

  protected
  def find_verified_user
  	if (current_student = Student.find_by_id cookies.signed['student.id'])
  		current_student
  	else
  		reject_unauthorized_connection
  	end
  end


  end
end
