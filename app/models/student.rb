class Student < User
	has_many:cursos
	belongs_to:curso
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :name, :lastname, :username, :rut, :type, :email, :password, :password_confirmation, :remember_me
end
