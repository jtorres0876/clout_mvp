class ApplicationController < ActionController::Base
  protect_from_forgery

  include ArtistSessionsHelper

private

def current_listener
  @current_listener ||= Listener.find(session[:listener_id]) if session[:listener_id]
end
helper_method :current_listener

# Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
