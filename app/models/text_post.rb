class TextPost < ActiveRecord::Base
  # attr_accessor :body
  validates :body, presence: true

  def index
    body
  end

end
