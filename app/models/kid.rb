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

class Kid < ActiveRecord::Base
  GRADOS = ['Primero',
            'Segundo',
            'Tercero',
            'Cuarto',
            'Quinto',
            'Sexto']
           
  mount_uploader :image, ImageUploader
  belongs_to :trooper
  
  validates :grade, :presence => true
  validates :name, :presence => true
  validates :birthdate, :presence => true
  
  def self.grades
    GRADOS
  end
  
  def self.grades_collection
    gc = Array.new
    GRADOS.each_with_index { |grado,index| gc << [grado, index+1]}
    gc
  end
  
  def community
    if self.trooper
      trooper.advisor.community
    else
      "N/A"
    end
  end
  
  def photo_html size=:normal
    if self.image.to_s.empty?
      url = "http://placehold.it/250x250"
    else
      url = self.image
    end
    if size==:normal
      "<img class='th' src='#{url}'/>"
    else
      "<img width='125px' height='125px' class='th' src='#{url}'/>"
    end
  end

  def grade_name
    GRADOS[grade-1] # 3 => Tercero  
  end
  
  def age
    now = Time.now.utc.to_date
    now.year - self.birthdate.year - ((now.month > self.birthdate.month || (now.month == self.birthdate.month && now.day >= self.birthdate.day)) ? 0 : 1)
  end
end
