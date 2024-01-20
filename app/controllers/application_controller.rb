class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue ActiveRecord::RecordNotFound
        session[:user_id] = nil
        nil
      end
    
      
    
      
    end
