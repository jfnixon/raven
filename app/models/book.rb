# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  author       :string(255)
#  image        :string(255)
#  edition_size :integer
#  edition_desc :string(255)
#  artworks_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Book < ActiveRecord::Base
  attr_accessible :author, :image
  
  # point off to the personalized stuff
  belongs_to :signing
  
  # point back to the collection
  has_many :artworks
  
  def signed?
    signing_id
  end
end
