class AddTrooperIdToReport < ActiveRecord::Migration
  def change
    add_column :reports, :trooper_id, :integer
  end
end
