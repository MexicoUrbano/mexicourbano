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
  before_save :validate_uniqueness


  accepts_nested_attributes_for :activities, allow_destroy: true

  def validate_uniqueness
    query_id = id || 0
    errors.add(:report, 'El reporte de esta semana para este niño ya fue creado')
    return !Report.where("week = ? and trooper_id = ? and kid_id = ? and id != ?", week, trooper_id, kid_id, query_id).exists?
  end
end

