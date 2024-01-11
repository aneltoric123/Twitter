class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  def index
    @tweets=Tweet.all
  end 

  def show
  end

  def new
    @tweet=Tweet.new
  end

  def edit
  end

  def create
    @tweet=Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: 'Tweet was sucessfully made.'
      else
        render :new
      end
  end
  def update
    if @tweet.update(tweet_params)
      redirect_to root_path, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path, notice: 'Tweet was successfully deleted.'
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
