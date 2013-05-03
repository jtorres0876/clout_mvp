class SessionsController < ApplicationController
  def create
    listener = Listener.from_omniauth(env["omniauth.auth"])
    session[:listener_id] = listener.id
    redirect_to listener_path(:listener_id)
  end

  def destroy
    session[:listener_id] = nil
    redirect_to root_url
  end
end
