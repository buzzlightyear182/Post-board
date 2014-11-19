class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  default_scope {order("created_at DESC")}

  validates :content, presence: true
end
