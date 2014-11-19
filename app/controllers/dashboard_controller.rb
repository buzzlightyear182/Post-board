class DashboardController < ApplicationController

  before_action :authorize

  def show
    @text_post = TextPost.new
    @image_post = ImagePost.new
    @posts = current_user.posts
  end
end
