class LikesController < ApplicationController
    before_action :find_tweet

    def create
      @like = Like.create(user: current_user, tweet: @tweet)
      redirect_to home_path, notice: 'Tweet liked successfully!'
    end
  
    def destroy
      @like = Like.find_by(user: current_user, tweet: @tweet)
      @like.destroy if @like
      redirect_to home_path, notice: 'Tweet unliked successfully!'
    end
  
    private
  
    def find_tweet
      @tweet = Tweet.find(params[:id])
    end
end
