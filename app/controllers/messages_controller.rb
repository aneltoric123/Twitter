class MessagesController < ApplicationController
    def index
        @received_messages = current_user.received_messages.order(created_at: :desc)
        @sent_messages = current_user.sent_messages.order(created_at: :desc)
      end
    
      def show
        @message = Message.find(params[:id])
        
        @message.mark_as_read if @message.recipient == current_user
      end
    
      def new
        @message = Message.new
      end
    
      def create
        @message = Message.new(message_params)
        @message.sender = current_user
    
        if @message.save
          redirect_to messages_path, notice: 'Message sent successfully.'
        else
          render :new
        end
      end
    
      private
    
      def message_params
        params.require(:message).permit(:recipient_id, :subject, :body)
      end
    end

