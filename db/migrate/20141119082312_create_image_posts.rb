class CreateImagePosts < ActiveRecord::Migration
  def change
    create_table :image_posts do |t|
      t.attachment :image
    end
  end
end
