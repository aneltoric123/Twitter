class FollowsController < ApplicationController
    def create
      @user = User.find(params[:followed_id])
  
      unless current_user.following?(@user)
        Follow.create(follower: current_user, followed: @user)
        redirect_to user_path(@user)
      else
        redirect_to user_path(@user)
      end
    end
  
    def destroy
        @user = User.find(params[:followed_id])
        current_user.following.delete(@user)
        redirect_to user_path(@user)
    end
  end
  