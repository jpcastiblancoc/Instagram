class RenameFollowingToFollower < ActiveRecord::Migration[6.1]
  def change
    rename_table :followings, :followers
  end
end
