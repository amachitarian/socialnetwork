class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :followers_users do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
      add_index :followers_users, :follower_id
      add_index :followers_users, :followed_id
      # users can follow each other only once
      add_index :followers_users, [:follower_id, :followed_id], unique: true
    end
end
