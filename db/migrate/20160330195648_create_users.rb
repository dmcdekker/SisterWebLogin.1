class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :school_or_workplace
      t.text :technical_expertise
      t.text :still_learning

      t.timestamps null: false
    end
  end
end
