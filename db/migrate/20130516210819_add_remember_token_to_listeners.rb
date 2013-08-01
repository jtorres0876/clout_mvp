class AddRememberTokenToListeners < ActiveRecord::Migration
  def change
    add_column :listeners, :remember_token, :string
  end
end
