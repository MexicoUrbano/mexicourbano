# == Schema Information
#
# Table name: troopers
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  advisor_id :integer
#

class Trooper < ActiveRecord::Base
  acts_as_user
  belongs_to :advisor
  has_many :kids
end
