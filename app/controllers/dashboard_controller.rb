class DashboardController < ApplicationController

  before_filter :authorize

  def show
    @post = Post.new
    @posts = current_user.posts
  end
end
