class AddNameToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :name, :string
  end
end
