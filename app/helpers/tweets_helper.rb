module TweetsHelper
    def render_tweet_content(content)
        content.body.to_s.gsub(/#\w+/) { |tag| link_to(tag, hashtag_tweets_path(name: tag.delete('#'))) }.html_safe
      end
end
