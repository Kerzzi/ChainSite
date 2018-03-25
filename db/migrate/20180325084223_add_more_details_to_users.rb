class AddMoreDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar, :string
    add_column :users, :username, :string
    add_column :users, :role, :string
    add_column :users, :time_zone, :string
    add_column :users, :summary, :string
  end
end
