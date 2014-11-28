class Timeline
  include ActiveModel::Model #Necessary for Rails 4
  extend ActiveModel::Naming

  def initialize user
    @user = user
  end

  def posts
    @user.posts
  end
end
