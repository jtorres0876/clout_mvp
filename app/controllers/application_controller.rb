class ApplicationController < ActionController::Base
  protect_from_forgery

private

def current_listener
  @current_listener ||= Listener.find(session[:listener_id]) if session[:listener_id]
end
helper_method :current_listener
end
