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

require 'spec_helper'

describe Report do
  pending "add some examples to (or delete) #{__FILE__}"
end
