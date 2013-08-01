class AddTypeToListeners < ActiveRecord::Migration
  def change
    add_column :listeners, :type, :string
  end
end
