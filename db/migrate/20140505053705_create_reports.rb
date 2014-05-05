class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.boolean :assistance
      t.text :general_observations
      t.string :grade

      t.timestamps
    end
  end
end
