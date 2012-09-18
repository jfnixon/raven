# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  author     :text
#  image      :text
#  signing_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  le_max     :integer
#  le_desc    :string(255)
#  title      :string(255)
#

class Book < ActiveRecord::Base
  attr_accessible :author, :image
  
  # point off to the personalized stuff
  belongs_to :signing
  
  # point back to the collection
  has_many :arts
  
  def signed?
    signing_id
  end
end
