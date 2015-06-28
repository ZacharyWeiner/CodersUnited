class Friendship < ActiveRecord::Base
include PublicActivity::Model
	belongs_to :user
	belongs_to :friend, class_name: "User"

#Accept 

	def accept_friendship
		self.update_attributes(state: "active", friended_at: Time.now)
	end

#Deny 
	def deny _friendship
		self.destroy
	end

#Cancel 
	def cancel_friendship
		self.destroy
	end
end
