# == Schema Information
#
# Table name: limited_editions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  creator    :string(255)
#  yubi_key   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LimitedEdition < ActiveRecord::Base
  attr_accessible :creator, :title, :yubi_key, :yubi_otp
  
  # the key attribute only keeps the first 12 chars of the yubi OTP
    
  def yubi_otp=(yubi)
    self.yubi_key = yubi[0..11]
  end
  
  def yubi_otp
    self.yubi_key
  end
  
  # find by yubi_key
  
  def self.yubi_find(val)
    key = val[0..11]
    self.where(:yubi_key => key).first
  end
  
  # is the yubi_otp valid
  
  def self.yubi_valid?(val)

  end
end
