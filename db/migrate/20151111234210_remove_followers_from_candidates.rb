class RemoveFollowersFromCandidates < ActiveRecord::Migration
  def change
    remove_column :candidates, :followers, :integer
  end
end
