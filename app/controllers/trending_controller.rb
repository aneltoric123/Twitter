class TrendingController < ApplicationController
    def index
      @trending_hashtags = Hashtag.trending_hashtags_past_week
    end
  end
  