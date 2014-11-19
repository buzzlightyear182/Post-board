class ImagePost < ActiveRecord::Base
  has_attached_file :image, styles: {
    post: "200x200"
  }

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
