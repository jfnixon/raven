class LimitedEdition < ActiveRecord::Base
  attr_accessible :creator, :title, :yubi_key, :yubi_otp
  
  # the key attribute only keeps the first 12 chars of the yubi OTP
    
  def yubi_otp=(yubi)
    self.yubi_key = yubi[0..11]
  end
  
  def yubi_otp
    self.yubi_key
  end

end
