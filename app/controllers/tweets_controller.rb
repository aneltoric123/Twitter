class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets=Tweet.order(created_at: :desc);
    @user=current_user
  end 

  def show
  end

  def new
    @tweet=Tweet.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet =current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to home_path, notice: 'Tweet was sucessfully made.'
      else
        render :new
      end
  end
  def update
    @tweet = current_user.tweets.find(params[:id])
  if @tweet.update(tweet_params)
    redirect_to home_path, notice: 'Tweet was successfully updated.'
  else
    render :edit
  end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.tweet_hashtags.destroy_all
    @tweet.replies.destroy_all
    @tweet.likes.destroy_all 
    @tweet.retweets.destroy_all
    @tweet.destroy
    redirect_to home_path, notice: 'Tweet was successfully deleted.'
    
  end
  def following
    @following_tweets = current_user.followed_users.map(&:tweets).flatten.sort_by(&:created_at).reverse
  end
  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
