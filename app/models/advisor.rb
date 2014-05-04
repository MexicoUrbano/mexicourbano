# == Schema Information
#
# Table name: advisors
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Advisor < ActiveRecord::Base
  acts_as_user
  has_many :troopers
  attr_accessor :password_temp

  # Este metodo deja unicamente los numeros contenidos
  # en el string de phone
  # 664-661-12-50 => 66416611250
  # +664 66-12-50 => 6616611250
  def telefono
    phone.gsub /[^\d]/, ''
  end

  def password_temp=(param)
    unless param.empty?
      self.password = param
    end
  end
end
