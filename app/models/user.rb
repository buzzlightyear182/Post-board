class User < ActiveRecord::Base
  include Clearance::User
  has_many :posts

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

  validates :username, presence: true, length: {maximum: 20}, format: {with: /\A[a-zA-Z0-9]+\z/}, uniqueness: true
  validates :encrypted_password, presence: true
  validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}, uniqueness: true

  def following? user
    followed_user_ids.include? user.id
  end

  def follow user
    followed_users << user
  end

  def unfollow user
    followed_users.delete user
  end
end
