class TextPostsController < ApplicationController

  def create
    content = build_content
    post = current_user.posts.create(content:content)
    unless post.save
      flash[:error] = "Cannot make a post"
    end
    redirect_to dashboard_path
  end

private

  def build_content
    TextPost.new text_post_params
  end

  def text_post_params
    params.require(:text_post).permit(:body)
  end
end
