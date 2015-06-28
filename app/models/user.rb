class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates_presence_of :username
         validates_uniqueness_of :username

    has_many :friendships, dependent: :destroy

    #needs to be able to find all people that requested to be our friend 
    has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy

    has_many :posts, dependent: :destroy


    def request_friendship(user_2)
    	self.friendships.create(friend: user_2)
    end

    def active_friends
      self.friendships.where(state: "active").map(&:friend) + self.inverse_friendships.where(state: "active").map(&:user)
    end 

    def pending_friend_requests_from
      self.inverse_friendships.where(state: "pending")
    end 

    def pending_friend_requests_to
      self.friendships.where(state: "pending")
    end 

    def friendship_status(user_2)
      friendships = Friendship.where(user_id: [self.id, user_2.id], friend_id: [self.id, user_2.id])
      unless friendships.any?
        return "not_friends"
      else
        if friendships.first[:state] == 'active'
          return "friends"
        else 
          #if the 'user' in the friendship is us, then that means the status is pending 
          #if the 'friend' in the relationship is us that that means the status is requested 
          if friendships.first.user == self 
            return "pending"
          else
            return "requested"
          end 
        end 
      end
    end

    def friendship_relation(user_2)
      friendship = Friendship.where(user_id: [self.id, user_2.id], friend_id: [self.id, user_2.id]).first
    end
end