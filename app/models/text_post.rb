class TextPost < ActiveRecord::Base
  validates :body, presence: true

  def index
    body
  end

end
