class Dashboard

  def initialize user
    @user = user
  end

  def new_text_post
    TextPost.new
  end

  def new_image_post
    ImagePost.new
  end

  def timeline
    Timeline.new @user
  end

end
