class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :creator
      t.references :userblog, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

