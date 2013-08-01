class AddImageToListeners < ActiveRecord::Migration
  def change
    add_column :listeners, :image, :string
  end
end
