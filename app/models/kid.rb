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
  
  def community
    if self.trooper
      trooper.advisor.community
    else
      "N/A"
    end
  end
  
  def photo_html
    if self.image.to_s.empty?
      url = "http://placehold.it/250x250"
    else
      url = self.image
    end
    "<img class='th' src='#{url}'/>"
  end

  def grade_name
    GRADOS[grade-1] # 3 => Tercero  
  end
  
  def age
    now = Time.now.utc.to_date
    now.year - self.birthdate.year - ((now.month > self.birthdate.month || (now.month == self.birthdate.month && now.day >= self.birthdate.day)) ? 0 : 1)
  end
end
