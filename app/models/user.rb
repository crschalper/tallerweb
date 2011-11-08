class User < ActiveRecord::Base
	has_many:cursos
	belongs_to:curso
	has_many:comments
	has_many:posts
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login
  attr_accessible :login, :name, :lastname, :username, :rut, :type, :email, :password, :password_confirmation, :remember_me
  
  validates :username, :uniqueness=>true
  validates :rut, :uniqueness =>true
  
   def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   login = conditions.delete(:login)
   where(conditions).where(["lower(username) = :value OR lower(email) = :value OR lower(rut) = :value", { :value => login.downcase }]).first
 end
  
end
