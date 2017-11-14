class SessionsController < ApplicationController

  def new
    render layout: false
  end

  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_path
  rescue
    redirect_to '/log_in'
  end

  def destroy
    session.delete(:user_id) if helpers.current_user
    redirect_to '/log_in'
  end
end