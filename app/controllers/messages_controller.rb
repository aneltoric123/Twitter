class MessagesController < ApplicationController
 
  
  def index
    
    @messages = Message.between(current_user, User.all)
  end
  
  def create
    @message = current_user.sent_messages.build(message_params)
    if @message.save
      redirect_to messages_path, notice: 'Message sent successfully!'
    else
      
      render :new
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:recipient_id, :content)
  end
end