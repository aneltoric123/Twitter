class MessagesController < ApplicationController
    def index
        @conversations = current_user.conversations.includes(:recipient)
      end
    def new
        @recipient = User.find(params[:recipient_id])
        @message = Message.new
        @messages = Message.where(sender_id: current_user.id, recipient_id: @recipient.id).or(Message.where(sender_id: @recipient.id, recipient_id: current_user.id)).order(:created_at)

      end
  
    def create
      @message = current_user.sent_messages.build(message_params)
      @recipient = User.find(params[:message][:recipient_id])
  
      @message.recipient = @recipient
  
      if @message.save
        redirect_to new_message_path(recipient_id: @recipient.id), notice: "Message sent successfully."
      else
        flash.now[:alert] = "Failed to send message."
        render :new
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:content)
    end
  end
  