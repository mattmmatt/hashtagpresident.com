class CreateFollowerCounts < ActiveRecord::Migration
  def change
    create_table :follower_counts do |t|
      t.references :candidate, index: true, foreign_key: true
      t.integer :twitter_follwers

      t.timestamps null: false
    end
  end
end
