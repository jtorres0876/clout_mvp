class TracksController < ApplicationController
before_filter :signed_in_artist
before_filter :correct_artist,	only: :destroy

	def new
		@track = current_listener.tracks.build(key: params[:key])
	end
	
	def index
		@songs = current_listener.tracks
		@uploader = current_listener.tracks.build(params[:track]).mp3file
		
		@uploader.success_action_redirect = new_track_url
	end

	def create
		@track = current_listener.tracks.build(params[:track])
		if @track.save
  			flash[:success] = "Track Uploaded!"
  			redirect_to artist_path(current_listener)	
  		else
  			render 'new'
  		end
	end

	def update
	end

	def destroy
		@track.destroy
		flash[:success] = "Track Removed!"
		redirect_to artist_path(current_listener)
	end

	private  
  
	def sanitize_filename(file_name)  
    	just_filename = File.basename(file_name)  
    	just_filename.sub(/[^\w\.\-]/,'_')  
	end 

	def correct_artist
		@track = current_listener.tracks.find_by_id(params[:id])
		redirect_to artist_path(current_listener) if @track.nil?
	end
end
