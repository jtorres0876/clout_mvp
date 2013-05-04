class ArtistSessionsController < ApplicationController
	def new
	end

	def create
		artist = Artist.find_by_email(params[:artist_session][:email].downcase)
		if artist && artist.authenticate(params[:artist_session][:password])
    		sign_in artist
    		redirect_to artist
    	else
    		flash.now[:error] = 'Invalid email/password combination'
    		render 'new'
    	end
  	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
