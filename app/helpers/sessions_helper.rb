module SessionsHelper

	def sign_in(listener)
		cookies.permanent[:remember_token] = listener.remember_token
		self.current_listener = listener
	end

	def signed_in?
		!current_listener.nil?
	end

	def is_artist?
		current_listener.type == 'Artist'
	end

	def sign_out
		self.current_listener = nil
		cookies.delete(:remember_token)
	end

	def current_listener=(listener)
		@current_listener = listener
	end

	def current_listener
		@current_listener ||= listener.find_by_remember_token(cookies[:remember_token])
	end

	def current_listener?(listener)
		listener == current_listener
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end

	def signed_in_artist
      unless signed_in?
        store_location
        redirect_to artist_portal_path, notice: "Please sign in."
      end
    end
end
