# == Schema Information
#
# Table name: kids
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  name       :string(255)
#  birthdate  :date
#  trooper_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Kid do
  pending "add some examples to (or delete) #{__FILE__}"
end
