class AddExpiryToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :expiry, :boolean, :default => false
  end
end
