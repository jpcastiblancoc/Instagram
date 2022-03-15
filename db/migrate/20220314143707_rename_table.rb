class RenameTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :following, :followings
  end
end
