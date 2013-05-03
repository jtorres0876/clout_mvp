class ListenersController < ApplicationController
  def show
  	@listener = Listener.find(params[:id])
  end

  def new
  	@listener = Listener.new
  end
end