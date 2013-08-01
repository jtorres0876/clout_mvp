require 'net/http'
require "net/https"
require "uri"

fb_url = "dialog/apprequests?app_id=115393751997458&message=Sign%20up%20for%20Clout%20Tune!&redirect_uri=http://localhost:3000/"
#fb_url = "#{fb_id}/notifications?access_token=#{app_access_token}&href=#{listener_path(current_listener)}&template=You have been sent a new song!"
puts "#{fb_url}"
uri = URI.encode("https://www.facebook.com/#{fb_url}")
uri = URI.parse(uri)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
fb_req = Net::HTTP::Post.new(uri.request_uri)
puts "#{uri}"
fb_response = http.request(fb_req)
puts "#{fb_response}"


#fb_url = "#{fb_id}/notifications?access_token=#{app_access_token}&href=#{listener_path(current_listener)}&template=You have been sent a new song!"
  		#uri = URI.encode("https://graph.facebook.com/#{fb_url}")
  		#uri = URI.parse(uri)
  		#http = Net::HTTP.new(uri.host, uri.port)
  		#http.use_ssl = true
  		#http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		#fb_req = Net::HTTP::Post.new(uri.request_uri)
  		#fb_response = http.request(fb_req)