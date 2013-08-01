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

require 'spec_helper'

describe Track do
  pending "add some examples to (or delete) #{__FILE__}"
end
