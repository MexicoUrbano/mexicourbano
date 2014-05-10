class AddStudentNumberAndSemesterToTroopers < ActiveRecord::Migration
  def change
    add_column :troopers, :student_number, :string
    add_index :troopers, :student_number
    add_column :troopers, :semester, :integer
  end
end
