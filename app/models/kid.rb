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

  def grade_name
    GRADOS[grade-1] # 3 => Tercero  
  end
  
  def age
    now = Time.now.utc.to_date
    now.year - self.birthdate.year - ((now.month > self.birthdate.month || (now.month == self.birthdate.month && now.day >= self.birthdate.day)) ? 0 : 1)
  end
end
