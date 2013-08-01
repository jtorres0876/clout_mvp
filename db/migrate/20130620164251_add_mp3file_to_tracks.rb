class AddMp3fileToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :mp3file, :string
  end
end
