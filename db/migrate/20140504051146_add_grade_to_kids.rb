class AddGradeToKids < ActiveRecord::Migration
  def change
    add_column :kids, :grade, :integer
  end
end
