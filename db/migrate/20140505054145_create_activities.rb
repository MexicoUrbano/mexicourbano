class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :report_id
      t.text :objective
      t.string :grade
      t.text :observation

      t.timestamps
    end
  end
end
