class AddAdminToListeners < ActiveRecord::Migration
  def change
    add_column :listeners, :admin, :boolean, default: false
  end
end
