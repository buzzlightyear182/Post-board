class Search
  attr_reader :term
  include ActiveModel::Model #Necessary for Rails 4
  extend ActiveModel::Naming

  def initialize options={}
    @term = options.fetch(:term, "")
  end

  def posts
    Post.text_posts.where(content_id: text_posts)
  end

  private

  def text_posts
    TextPost.where("body ILIKE ?", search_term)
  end

  def search_term
    "%#{term}%"
  end
end
