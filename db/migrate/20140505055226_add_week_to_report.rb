class AddWeekToReport < ActiveRecord::Migration
  def change
    add_column :reports, :week, :integer
  end
end
