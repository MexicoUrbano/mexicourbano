class AddCommunityToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :community, :string
    add_index :advisors, :community
  end
end
