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

class Activity < ActiveRecord::Base
  belongs_to :report
end
