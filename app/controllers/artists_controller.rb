class ArtistsController < ApplicationController
before_filter :signed_in_artist  
before_filter :correct_artist   
before_filter :admin_user,        only: [:index, :destroy] 

  def show
  	#@artist = Artist.find(params[:id])
    #@tracks = @artist.tracks.all
  end

  def index
    @artists = Artist.paginate(page: params[:page])
  end

  def new
  	@artist= Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      flash[:success] = "Artist Profile update"
      redirect_to @artist 
    else
      render 'edit'
    end
  end


  def destroy
    Artist.find(params[:id]).destroy
    flash[:success] = "Artist destroyed."
    redirect_to artists_url
  end


  private

    def correct_artist
      @artist = Artist.find(params[:id])
      redirect_to(root_path) unless current_listener?(@artist)
    end

    def admin_user
      redirect_to(root_path) unless current_listener.admin?
    end 
end
