class Post < ActiveRecord::Base
	belongs_to:user
	has_many:comments
	has_many:archivos
	
	validates :title, :presence => true
	validates :content, :presence =>true
	validates :nota, :presence =>true
	
	has_attached_file :image
		
	
end
