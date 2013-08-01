# == Schema Information
#
# Table name: listeners
#
#  id                  :integer          not null, primary key
#  provider            :string(255)
#  uid                 :string(255)
#  name                :string(255)
#  oauth_token         :string(255)
#  oauth_expires_at    :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  remember_token      :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  location            :string(255)
#  image               :string(255)
#  type                :string(255)
#  bio                 :text
#  website             :string(255)
#  genre               :string(255)
#  admin               :boolean          default(FALSE)
#

class Listener < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid, :avatar, :image
  before_save :create_remember_token
  has_attached_file :avatar, :styles => { :medium => "300 X 300", :thumb => "100x100>" }, :default_url => "/images/:style/mising.png"
  validates :name, presence: true
  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |listener|
      listener.provider = auth.provider
      listener.uid = auth.uid
      listener.name = auth.info.name unless listener.name 
      listener.oauth_token = auth.credentials.token
      listener.oauth_expires_at = Time.at(auth.credentials.expires_at)
      listener.location = auth.info.location
      listener.image = auth.info.image unless listener.image
      listener.bio = "Enter Bio" unless listener.bio
      listener.website = "Enter Website" unless listener.website 
      listener.genre = "Enter Genre" unless listener.genre   
      listener.save!
    end
  end

  def facebook
   @facebook ||= Koala::Facebook::API.new(oauth_token)
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
