class RetweetsController < ApplicationController
    before_action :find_tweet

    def create
      @retweet = Retweet.create(user: current_user, tweet: @tweet)
      redirect_to home_path, notice: 'Tweet retweeted successfully!'
    end
  
    def destroy
      @retweet = Retweet.find_by(user: current_user, tweet: @tweet)
      @retweet.destroy if @retweet
      redirect_to home_path, notice: 'Retweet removed successfully!'
    end
  
    private
  
    def find_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end
end
