class AddBioWebsiteGenreToListeners < ActiveRecord::Migration
  def change
    add_column :listeners, :bio, :text
    add_column :listeners, :website, :string
    add_column :listeners, :genre, :string
  end
end
