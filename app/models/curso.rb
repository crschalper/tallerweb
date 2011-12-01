class Curso < ActiveRecord::Base
	belongs_to:user
	has_many:users
	belongs_to:student
	has_many:students
	belongs_to:teacher	
	has_many:teachers

end
