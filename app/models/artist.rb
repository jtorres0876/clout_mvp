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

class Artist < Listener
  attr_accessible :name, :genre, :website, :bio
  has_many :tracks, dependent: :destroy

  
  validates :genre, presence: true
  validates :website, presence: true
  validates :bio, presence: true

end
