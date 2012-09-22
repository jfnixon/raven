# == Schema Information
#
# Table name: artworks
#
#  id           :integer          not null, primary key
#  yubikey      :string(255)
#  personal_msg :string(255)
#  work_number  :integer
#  signing_id   :integer
#  user_id      :integer
#  book_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Artwork < ActiveRecord::Base
  attr_accessible :yubikey, :yubi_otp, :work_number, :user_id, :book_id
  
  # this artwork belongs to a single user
  belongs_to :user
  
  # this artwork blongs to a single book.
  # Later we'll make this polymorphic.
  belongs_to :book
  accepts_nested_attributes_for :book
  
  # validates :book_id, :presence => true
  # validates :work_number, :numericality => { :only_integer => true } 
  
  # yubi_otp is a virtual asset. We only need the first 12 characters to store in the yubikey.
  # yubi_valid determines if the OTP is valid.
  
  def yubi_otp(yubi)
    self.yubikey = yubi[0..11]
  end
  
  # otp.replayed? will tell if there is a replay
  
  def yubi_valid?(yubiOTP)
    begin
      otp = Yubikey::OTP::Verify.new(yubiOTP)

      otp.valid? ? true : false
    rescue Yubikey::OTP::InvalidOTPError
      false
    end
  end
  
  def self.yubi_find(key)
    where(:yubikey => key[0..11]).first
  end
  
  def self.my_collection(user)
    where(:user_id => user.id)
  end
end
