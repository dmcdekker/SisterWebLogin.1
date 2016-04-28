class AddPennameToUser < ActiveRecord::Migration
  def change
    add_column :users, :penname, :string
  end
end
