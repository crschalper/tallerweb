class Comment < ActiveRecord::Base
	belongs_to:user
	belongs_to:post
	
	validates :content, :presence =>true
	validates :nota, :presence =>true
end