OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider 	:facebook, '115393751997458', '5722ed4409038a1a77e881ff59ff5520',
  			:scope => 'email,user_birthday,read_stream'
end