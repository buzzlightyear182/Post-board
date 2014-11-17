class PostsController < ApplicationController

  def create
    post = current_user.posts.create post_params
    redirect_to dashboard_path
  end

  def show
    @post = Post.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:body)
  end
end
