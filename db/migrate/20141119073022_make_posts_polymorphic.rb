class MakePostsPolymorphic < ActiveRecord::Migration
  def change
    remove_column :posts, :body
    add_column :posts, :content_type, :string
    add_column :posts, :content_id, :integer
    add_index :posts, [:content_type, :content_id]
  end
end
