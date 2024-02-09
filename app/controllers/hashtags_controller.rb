class HashtagsController < ApplicationController
    def show
      @hashtag = Hashtag.find_by(name: "##{params[:name]}")
      if @hashtag
        @tweets = @hashtag.tweets.order(created_at: :desc)
      else
        @tweets = []
        
      end
    end
  end
  