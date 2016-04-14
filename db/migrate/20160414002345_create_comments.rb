class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text       :posts
      t.references :user
    end
  end
  def down ; drop_table 'comments' ; end
end