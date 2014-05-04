# == Schema Information
#
# Table name: troopers
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  advisor_id     :integer
#  student_number :string
#  semester       :integer
#

class Trooper < ActiveRecord::Base
  acts_as_user
  belongs_to :advisor
  has_many :kids

  validates :semester, :numericality => {less_than_or_equal_to: 12, greater_than: 0}
  validates :student_number, :format => {:with => /\AA\d{8}\Z/}
  validates :student_number, :uniqueness => true
  validates :advisor_id, :presence => true
  validates :name, :presence => true

  before_validation :standarize_student_number

  def community
    advisor.community
  end

  def standarize_student_number
    self.student_number = student_number.upcase
  end
end
