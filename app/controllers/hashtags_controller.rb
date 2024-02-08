class HashtagsController < ApplicationController
    def show
      @hashtag = Hashtag.find_by(name: "##{params[:name]}")
      if @hashtag
        @tweets = @hashtag.tweets.order(created_at: :desc)
        # Other code...
      else
        @tweets = []
        # Other code...
      end
    end
  end
  