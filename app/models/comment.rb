class Comment < ActiveRecord::Base
	belongs_to:user
	belongs_to:post
	has_many :comms
	
	validates :content, :presence =>true
end
