module ArtistSessionsHelper
	
	def sign_in(artist)
		cookies.permanent[:remember_token] = artist.remember_token
		self.current_artist = artist
	end

	def signed_in?
		!current_artist.nil?
	end

	def sign_out
		self.current_artist = nil
		cookies.delete(:remember_token)
	end

	def current_artist=(artist)
		@current_artist = artist
	end

	def current_artist
		@current_artist ||= Artist.find_by_remember_token(cookies[:remember_token])
	end
end
