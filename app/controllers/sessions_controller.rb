class SessionsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to links_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
