class User < ActiveRecord::Base
  include Clearance::User
  has_many :posts

  validates :username, presence: true, length: {maximum: 20}, format: {with: /\A[a-zA-Z0-9]+\z/}, uniqueness: true
  validates :encrypted_password, presence: true
  validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}, uniqueness: true
end
