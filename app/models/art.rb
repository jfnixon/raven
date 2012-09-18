# == Schema Information
#
# Table name: arts
#
#  id         :integer          not null, primary key
#  yubikey    :text
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  le_count   :integer
#

class Art < ActiveRecord::Base
  attr_accessible :yubikey
  
  # this artwork belongs to a single user
  belongs_to :user
  
  # this artwork blongs to a single book.
  # Later we'll make this polymorphic.
  belongs_to :book
  accepts_nested_attributes_for :book
  
  # yubi_otp is a virtual asset. We only need the first 12 characters to store in the yubikey.
  # yubi_valid determines if the OTP is valid.
  
  def yubi_otp(yubi)
    self.yubikey = yubi[0..11]
  end
  
  def yubi_valid?(yubi)
    true
  end
  
  def self.yubi_find(key)
    search_key = key[0..1]
    self.where(:yubikey => search_key).first
  end
end
