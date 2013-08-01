# == Schema Information
#
# Table name: tracks
#
#  id                  :integer          not null, primary key
#  artist_id           :integer
#  name                :string(255)
#  price               :decimal(, )
#  download            :boolean
#  play_limit          :integer
#  image               :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  mp3file             :string(255)
#

class Track < ActiveRecord::Base
  attr_accessible :download, :image, :name, :play_limit, :price, :avatar, :mp3file
  has_attached_file :avatar, :styles => { :medium => "300 X 300>", :thumb => "100x100>" }, 
  					:url  => "/assets/products/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension",
  					:default_url => "/images/:style/mising.png"
  belongs_to :artist
  
  mount_uploader :image, ImageUploader
  mount_uploader :mp3file, Mp3fileUploader

  validates :artist_id, presence: true
  #validates_attachment_presence :avatar
  #validates_attachment_size :avatar, less_than: 1.megabytes
  #validates_attachment_content_type :avatar, content_type: ['image/jpeg', 'image/png']
  validates :name, presence: true 
  validates :play_limit, presence: true,  numericality: { only_integer: true } 
  validates :price, presence: true, numericality: true
  #validates :mp3file, presence: true 


  def image_name
    File.basename(mp3file.path || mp3file.filename) if mp3file
  end
end
