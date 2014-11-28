module PostsHelper

  def tag_posts text
    link_hashtags(strip_tags(text)).html_safe
  end

private

  def link_hashtags text
    text.gsub(/#\w+/) { |match| link_to match, hashtag_path(match[1..-1]) }
  end
end
