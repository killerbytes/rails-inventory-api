class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :token, :string
    add_column :users, :activated, :boolean
    add_column :users, :admin, :boolean
  end
end
