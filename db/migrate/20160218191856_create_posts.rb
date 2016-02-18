class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.text :body
      t.string :picture

      t.timestamps null: false
    end
  end
end
