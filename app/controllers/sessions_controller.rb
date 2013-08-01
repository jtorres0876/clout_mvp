class SessionsController < ApplicationController

  def create
    state = request.env['omniauth.params']['state']
   	if  state == "listener"
      listener = Listener.from_omniauth(env["omniauth.auth"])
      session[:listener_id] = listener.id
      redirect_back_or listener_path(session[:listener_id])
    else	
       artist = Artist.from_omniauth(env["omniauth.auth"])
       session[:listener_id] = artist.id
       if state == "artistnew"
          redirect_to edit_artist_path(session[:listener_id])    
       else 
          redirect_to artist_path(session[:listener_id])  
       end 
    end
  end

  def destroy
    session[:listener_id] = nil
    redirect_to root_url
  end


end
