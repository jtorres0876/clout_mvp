class ArtistSessionsController < ApplicationController
	
  	def create
      artist = Artist.from_omniauth(env["omniauth.auth"])
      session[:artist_id] = artist.id
      redirect_to artist_path(session[:artist_id])
  	end

	#def destroy
	#	sign_out
	#	redirect_to root_url
	#end

	def destroy
    	session[:artist_id] = nil
    	redirect_to root_url
  	end

end
