class TweetsController < ApplicationController
  def index
    @tweets=Tweet.all
    @users=User.all
  end 

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
  end
end
