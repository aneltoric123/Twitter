class TrendingController < ApplicationController
  def index
    @trending_hashtags = Hashtag.joins(:tweet_hashtags).group(:id, :name).order('COUNT(tweet_hashtags.hashtag_id) DESC').limit(10)
  end
end
