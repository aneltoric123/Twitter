class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @liked_tweets=@user.liked_tweets.order(created_at: :desc);
    @retweeted_tweets=@user.retweeted_tweets.order(created_at: :desc);
    @current_user = current_user
  end
  def show_messages
    @other_user = User.find(params[:id])
    @current_user = current_user
  @messages = Message.between(@current_user, @other_user)
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: 'Account created successfully'
    else
      render :new
    end
  end
def destroy
  if @user
    @user.tweets.destroy_all
    @user.likes.destroy_all
    @user.replies.destroy_all
    @user.follow.destroy_all
    @user.following.destroy_all
    @user.messages.destroy_all
    @user.retweets.destroy_all
    @user.destroy
    redirect_to root_path
end
end
def follow
  @user = User.find(params[:id])
  current_user.follow(@user)
  redirect_to @user
end

def unfollow
  @user = User.find(params[:id])
  current_user.unfollow(@user)
  redirect_to @user
end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
