class Timeline
  include ActiveModel::Model #Necessary for Rails 4
  extend ActiveModel::Naming

  def initialize user
    @user = user
  end

  def posts
    Post.where(user_id: post_user_ids)
  end

  private

  def post_user_ids
    @user.followed_user_ids + [@user.id]
   #Generate SQL statement: SELECT * FROM Posts WHERE user_id IN [array of followed_user_ids and current_user_id]
  end
end
