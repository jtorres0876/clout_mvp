class RemoveNameFromArtists < ActiveRecord::Migration
  def up
    remove_column :artists, :name
  end

  def down
    add_column :artists, :name, :string
  end
end
