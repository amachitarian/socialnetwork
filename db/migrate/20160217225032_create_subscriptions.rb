class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :leader_id, index: true, foreign_key: true
      t.integer :follower_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
