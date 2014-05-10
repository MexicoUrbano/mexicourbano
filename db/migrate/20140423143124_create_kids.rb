class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :image
      t.string :name
      t.date :birthdate
      t.integer :trooper_id

      t.timestamps
    end
  end
end
