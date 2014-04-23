class AddRelationToTroopers < ActiveRecord::Migration
  def change
    add_column :troopers, :advisor_id, :integer
  end
end
