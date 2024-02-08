# app/controllers/replies_controller.rb
class RepliesController < ApplicationController
  before_action :set_reply, only: [:destroy]
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.build(reply_params)
    @reply.user = current_user

    if @reply.save
      redirect_to home_path
    else
      redirect_to home_path
    end
  end
    def destroy
      @reply.destroy
    redirect_to home_path
    end
  

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
