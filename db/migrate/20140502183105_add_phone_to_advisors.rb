class AddPhoneToAdvisors < ActiveRecord::Migration
  def change
    add_column :advisors, :phone, :string
  end
end
