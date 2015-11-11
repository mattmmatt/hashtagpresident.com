class ChangeFollowerNameOnFollowerCount < ActiveRecord::Migration
  def change
    rename_column :follower_counts, :twitter_follwers, :twitter_followers
  end
end
