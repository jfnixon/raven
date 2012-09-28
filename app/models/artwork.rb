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
  
  # TBD: these cause problems in the create book then create artwork decision we are using.
  # validates :book_id, :presence => true
  # validates :work_number, :numericality => { :only_integer => true } 
  
  ###########
  # Yubikey methods. Here for now, since we do not use yubikeys anywhere but Artwork.
  # Yubikeys have 32 chars of encrypted data, and 0..48 ModHex chars total. So a valid-looking
  # yubikey will have a length of 32..48, with the first 0..16 chars being the fixed ID.
  # For the moment, we are using 12 char IDs which implies 44 char yubi_otp.
  
  # yubi_otp is a virtual asset. We only need the fixed characters to store in the yubikey.
  # yubi_valid determines if the OTP is valid.
  
  def yubi_otp=(yubi)
    self.yubikey = yubi[0..11]
  end
  
  def yubi_otp
    yubikey
  end
  
  # yubi_ish? tells if the pattern might be a yubi_otp
  
  def self.yubi_ish?(pattern)
    pattern.length == 44 ? true : false
  end
  
  # otp.replayed? will tell if there is a replay
  
  def self.yubi_valid?(yubiotp)
    begin
      otp = Yubikey::OTP::Verify.new(yubiotp)
      logger.debug("Yubi_valid: #{otp.valid?} and #{yubiotp}")

      otp.valid?
    rescue Yubikey::OTP::InvalidOTPError
      logger.debug("Yubi_valid: InvalidOTPError")
      false
    end
  end
  
  def self.find_by_yubi(key)
    where(:yubikey => key[0..11])
  end
 
  # end of Yubikey methods
  ###########
  
  def self.my_collection(user)
    where(:user_id => user.id)
  end
  
  # The search function looks for artwork with a yubikey match or the search term in title or author
  # TBD - just uses one term.
  
  def self.search(params)
    
    unless params.has_key?(:search)
      return Artwork.all
    end
    
    if Artwork.yubi_ish? params[:search]
        art = Artwork.find_by_yubi params[:search][0..11]
        return [art] unless art.empty?
    end

    # either we didn't find any book with the yubikey, or we have a non-yubi pattern
    
    q = "%#{params[:search]}%"
    Artwork.where("book.title LIKE ? OR book.author LIKE ?", q, q)
  end
end
