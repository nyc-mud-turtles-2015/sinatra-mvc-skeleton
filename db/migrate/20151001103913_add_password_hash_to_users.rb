class AddPasswordHashToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password
    add_column :users, :password_hash, :string, null: false
  end
end
