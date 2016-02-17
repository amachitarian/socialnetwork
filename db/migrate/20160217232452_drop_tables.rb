class DropTables < ActiveRecord::Migration
  def change
    drop_table :followers
    drop_table :followers_users
  end
end
