class ImagePostsController < ApplicationController

  def create
    content = build_content
    post = current_user.posts.create(content:content)
    unless post.save
      flash[:error] = "Cannot upload the image"
    end
    redirect_to dashboard_path
  end

private

  def build_content
    ImagePost.new(image_post_params)
  end

  def image_post_params
    params.require(:image_post).permit(:image)
  end
end
