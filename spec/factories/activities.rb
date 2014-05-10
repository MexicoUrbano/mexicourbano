# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  report_id   :integer
#  objective   :text
#  grade       :string(255)
#  observation :text
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    report_id 1
    objective "MyText"
    grade "MyString"
    observation "MyText"
  end
end
