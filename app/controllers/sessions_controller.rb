class SessionsController < ApplicationController
  def create
    if auth_hash.present?

      user = User.find_or_create_from_google_auth(auth_hash)
      session[:user_id] = user.id
      redirect_to home_path, notice: 'Logged in successfully!'
    else
      # User is logging in with email and password
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to home_path, notice: 'Logged in successfully!'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully!'
  end
  def google_oauth2
    redirect_to '/auth/google_oauth2'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
