# == Schema Information
#
# Table name: troopers
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  advisor_id     :integer
#  student_number :string(255)
#  semester       :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trooper do
  end
end
