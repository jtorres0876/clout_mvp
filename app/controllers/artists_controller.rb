class ArtistsController < ApplicationController
  def show
  	@artist = Artist.find(params[:id])
  end

  def new
  	@artist= Artist.new
  end

  def create
  	@artist = Artist.new(params[:artist])
  	if @artist.save
  		flash[:sucess] = "Welcome to Clout MVP!"
  		redirect_to @artist
  	else
  		render 'new'
  	end
  end
end
