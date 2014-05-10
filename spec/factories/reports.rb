# == Schema Information
#
# Table name: reports
#
#  id                   :integer          not null, primary key
#  assistance           :boolean
#  general_observations :text
#  grade                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  trooper_id           :integer
#  kid_id               :integer
#  week                 :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    assistance false
    general_observations "MyText"
    grade "MyString"
  end
end
