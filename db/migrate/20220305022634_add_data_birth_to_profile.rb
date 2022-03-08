class AddDataBirthToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :dataBirth, :date
  end
end
