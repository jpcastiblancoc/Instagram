class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.integer :profile_id, null: false, foreign_key: true
      t.integer :profile_follower_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
