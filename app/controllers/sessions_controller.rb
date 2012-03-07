class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
      if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to new_session_url, :notice => "Incorrect Email or Password"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'You are now signed out.'
  end

end
