# == Schema Information
#
# Table name: advisors
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Advisor < ActiveRecord::Base
  acts_as_user
  has_many :troopers
end
