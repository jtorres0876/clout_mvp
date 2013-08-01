class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
 
  

  

private


def current_listener
 @current_listener ||= Listener.find(session[:listener_id]) if session[:listener_id]
end
helper_method :current_listener

def artist_tracks
	if session[:listener_id]
    	@artist_tracks =  current_listener.tracks.all
    end
end
helper_method :artist_tracks


# Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
