# == Schema Information
#
# Table name: troopers
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Trooper < ActiveRecord::Base
  acts_as_user
end
