# == Schema Information
#
# Table name: advisors
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Advisor < ActiveRecord::Base
  COMUNIDADES = ["La Cáscara, Montemorelos",
                  "Loma Alta, Linares",
                  "El Galeme, Montemorelos",
                  "El Roble, Montemorelos",
                  "Ejido Chihuaha, Montemorelos",
                  "Lirios, Montemorelos",
                  "Jauregui, Allende",
                  "Paso Hondo, Allende",
                  "Lazarillos de Abajo, Allende",
                  "San Antonio, Allende",
                  "El Terrero, Montemorelos",
                  "San José, Linares"
                ]

  acts_as_user
  has_many :troopers
  validates :phone, length: { minimum: 10}
  validates :phone, numericality: true
  before_validation :telefono

  def self.communities
    COMUNIDADES
  end

  def telefono
    self.phone = phone.gsub /[^\d]/, '' # +664 66-12-50 => 6616611250
  end
end
