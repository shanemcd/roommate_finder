class SessionsController < ApplicationController
  skip_authorization_check
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    current_user = session
    redirect_to user
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
