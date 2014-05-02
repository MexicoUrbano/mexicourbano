class RemoveNameFromAdvisors < ActiveRecord::Migration
  def change
    remove_column :advisors, :name, :string
  end
end
