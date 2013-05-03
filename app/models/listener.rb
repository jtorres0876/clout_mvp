class Listener < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |listener|
      listener.provider = auth.provider
      listener.uid = auth.uid
      listener.name = auth.info.name
      listener.oauth_token = auth.credentials.token
      listener.oauth_expires_at = Time.at(auth.credentials.expires_at)
      listener.save!
    end
  end
end
