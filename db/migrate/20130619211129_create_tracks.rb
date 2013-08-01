class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :artist_id
      t.string :name
      t.decimal :price
      t.boolean :download
      t.integer :play_limit
      t.string :image

      t.timestamps
    end
  end
end
