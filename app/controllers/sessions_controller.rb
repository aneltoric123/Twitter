class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        redirect_to root_path, notice: 'Logged in successfully!'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
  
    def destroy
      redirect_to root_path, notice: 'Logged out successfully!'
    end
  end
  