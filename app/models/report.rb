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

class Report < ActiveRecord::Base
  belongs_to :trooper
  belongs_to :kid
  has_many :activities

  validates :kid, presence: true

  accepts_nested_attributes_for :activities, allow_destroy: true
end
