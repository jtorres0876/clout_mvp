class AddLocationToListeners < ActiveRecord::Migration
  def change
    add_column :listeners, :location, :string
  end
end
