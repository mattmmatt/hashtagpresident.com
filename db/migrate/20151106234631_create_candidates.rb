class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :party
      t.string :twitter_url
      t.integer :followers

      t.timestamps null: false
    end
  end
end
