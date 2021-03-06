class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      raise "Sorry, you failed to login!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
