# app/controllers/replies_controller.rb
class RepliesController < ApplicationController

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
  def update
    if @reply.update(reply_params)
      redirect_to tweet_path(@reply.tweet), notice: 'Reply was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reply.destroy
    redirect_to tweet_path(@reply.tweet), notice: 'Reply was successfully deleted.'
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
