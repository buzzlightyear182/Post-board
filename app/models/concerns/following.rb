module Following
  extend ActiveSupport::Concern

  included do
    ## Gets all users YOU are following
    has_many :followed_user_relationships,
      foreign_key: :follower_id,
      # returns SELECT * FROM following_relationships WHERE follower_id = ? (instead of user_id=?)
      class_name: 'FollowingRelationship'
    has_many :followed_users, through: :followed_user_relationships

    ## Gets all users who are following you
    has_many :follower_relationships,
      foreign_key: :followed_user_id,
      # returns SELECT * FROM following_relationships WHERE followed_user_id = ? (need to setup new relationship so that foreign key will be overridden followed_user_id instead of follower_id)
      class_name: 'FollowingRelationship'
    has_many :followers, through: :follower_relationships
  end

  def following? user
    followed_user_ids.include? user.id
  end

  def follow user
    followed_users << user
  end

  def unfollow user
    followed_users.delete user
  end

  # module ClassMethods
  # methods defined here are going to extend the class, not the instance of it
  #   def with_followers
  #     where(...)
  #   end

  # end
end
