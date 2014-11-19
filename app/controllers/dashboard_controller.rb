class DashboardController < ApplicationController

  before_action :authorize

  def show
    @text_post = TextPost.new
    @posts = current_user.posts
  end
end
