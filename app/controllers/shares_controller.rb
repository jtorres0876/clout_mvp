require 'net/http'
require "net/https"
require "uri"
class SharesController < ApplicationController

	def index
		@listener = current_listener
		@share_list = params[:friend_ids]
  		#@uri = URI.encode("https://graph.facebook.com/#{fb_url}")

	end

	def new
		@listener = current_listener
    	@friends = @listener.facebook.get_connection("me", "friends")
	end

	def create
		fb_url = "dialog/apprequests?app_id=115393751997458&to=#{params[:friend_ids]}&message=Sign%20up%20for%20Clout%20Tune!&redirect_uri=http://localhost:3000/" 
		uri = URI.encode("https://www.facebook.com/#{fb_url}")
		uri = URI.parse(uri)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		fb_req = Net::HTTP::Post.new(uri.request_uri)
		fb_response = http.request(fb_req)

    	#@listener = current_listener
    	#@share_list = params[:friend_ids]  	
    	#@share_list.each do |friend|
    		#send_notification(friend, current_listener.oauth_token)	
    	#end
    	redirect_to listener_path(current_listener) 
  	end

  	private

  	def send_notification(fb_id, app_access_token)
		
		#@g.put_connections(receiver.fb_id, "notifications",
                          #template: "@[#{current_user.fb_id}] sizə Şaxta Baba ilə \"#{GIFTS[gift][:title]}\" göndərdi.",
                         # href: "activities?method=get")
		#fb_url = "#{fb_id}/notifications?access_token=#{app_access_token}&href=#{listener_path(current_listener)}&template=You have been sent a new song!"
  		#uri = URI.encode("https://graph.facebook.com/#{fb_url}")
  		#uri = URI.parse(uri)
  		#http = Net::HTTP.new(uri.host, uri.port)
  		#http.use_ssl = true
  		#http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		#fb_req = Net::HTTP::Post.new(uri.request_uri)
  		#fb_response = http.request(fb_req)
	end

end
