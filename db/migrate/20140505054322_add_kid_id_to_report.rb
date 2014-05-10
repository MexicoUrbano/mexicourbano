class AddKidIdToReport < ActiveRecord::Migration
  def change
    add_column :reports, :kid_id, :integer
  end
end
