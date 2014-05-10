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

require 'spec_helper'

describe Activity do
  pending "add some examples to (or delete) #{__FILE__}"
end
