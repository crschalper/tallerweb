class User < ActiveRecord::Base
	has_one:curso
	belongs_to:curso
	has_many:comments
	has_many:posts
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :login
  attr_accessible :login, :name, :lastname, :username, :rut, :type, :email, :curso_id, :password, :password_confirmation, :remember_me
  
  validates :username, :presence=>true
validates_uniqueness_of :username, :message=>'Este usuario ya existe. Debe escoger otro.'
  validates :rut, :presence=>true, :length =>{:in =>8..9, :too_short=> "es muy corto"}
  validates_uniqueness_of :rut, :message=>'Este rut ya existe. Debe escoger otro.'
  validates :email, :presence=>true
  validates_uniqueness_of :email, :message=>'Este correo ya existe. Debe escoger otro.'
  validates :name, :presence =>true
  validates :lastname, :presence =>true

  
  
   def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   login = conditions.delete(:login)
   where(conditions).where(["lower(username) = :value OR lower(email) = :value OR lower(rut) = :value", { :value => login.downcase }]).first
 end
  
end
