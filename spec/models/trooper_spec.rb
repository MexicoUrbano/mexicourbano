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

require 'spec_helper'

describe Trooper do
  pending "add some examples to (or delete) #{__FILE__}"
end
