class Search
  attr_reader :term
  include ActiveModel::Model #Necessary for Rails 4
  extend ActiveModel::Naming

  def initialize options={}
    @term = options.fetch(:term, "")
  end

  def posts
    Post.search do
      fulltext term
    end.results
  end

## NO NEED for this since we used Sunspot gem
  # private

  # def text_posts
  #   TextPost.where("body ILIKE ?", search_term)
  # end

  # def search_term
  #   "%#{term}%"
  # end
end
