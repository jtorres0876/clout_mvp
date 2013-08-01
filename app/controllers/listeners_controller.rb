class ListenersController < ApplicationController
#before_filter :signed_in_listener,  only: [:edit, :update]
#before_filter :correct_listener,    only: [:edit, :update]
#before_filter :admin_listener,        only: :destroy 

  def show
  	@listener = Listener.find(params[:id])
    
  end

  def new
  	@listener = Listener.new
  end

  def edit
  end

  def update
    if @listener.update_attributes(params[:id])
      flash[:success] = "Listener Profile update"
      sign_in @listener
      redirect_to @listener
    else
      render 'edit'
    end
  end

  def create
  	@listener = Listener.new(params[:id])
  	if @listener.save
      sign_in @listener
  		flash[:sucess] = "Welcome to Clout MVP!"
  		redirect_to listner
  	else
  		render 'new'
  	end
  end

  def destroy
    Listner.find(params[:id]).destroy
    flash[:success] = "Listener destroyed."
    redirect_to listener_url
  end


  private
    def signed_in_listener
      store_location
      redirect_to "/signup", notice: "Please sign in." unless signed_in?
    end

    def correct_artist
      @listener = Listener.find(params[:id])
      redirect_to(root_path) unless current_listener?(@listener)
    end

    def admin_user
      redirect_to(root_path) unless current_listener.admin?
    end 
end