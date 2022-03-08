class RenameColumns < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :profiles, :username, :user_name
    rename_column :profiles, :dataBirth, :date_birth
  end
end
