class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  default_scope {order("created_at DESC")}

  validates :content, presence: true

  def self.text_posts
    where(content_type: 'TextPost')
  end

  searchable do
    text :content do
      content.index
    end
  end

end
