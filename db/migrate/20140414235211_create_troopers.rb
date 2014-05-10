class CreateTroopers < ActiveRecord::Migration
  def change
    create_table :troopers do |t|

      t.timestamps
    end
  end
end
