CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               'AWS',                        
    aws_access_key_id:      'AKIAI2HVOZSCRMXA6R6A',   
    aws_secret_access_key:  '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'
    #region: 				'US Standard'                                         
  }

  config.fog_directory  = 'cloutmvpmp3'                     # required
  config.will_include_content_type = true
  config.max_file_size     = 10.megabytes 
end