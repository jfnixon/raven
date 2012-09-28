# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  author       :string(255)
#  title        :string(255)
#  image        :string(255)      default("")
#  edition_size :integer          default(1)
#  edition_desc :string(255)      default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Book < ActiveRecord::Base
  attr_accessible :author, :image, :title, :edition_size, :edition_desc
  
  # point back to the collection
  has_many :artworks
  
  # The search function looks for books with the specified value in title or author
  # TBD - just uses one term.
  
  def self.search(params)
    
    unless params.has_key?(:search)
      return Book.all
    end
    
    if Artwork.yubi_ish? params[:search]
        art = Artwork.find_by_yubi params[:search][0..11]
        return [art.first.book] unless art.empty?
    end

    # either we didn't find any book with the yubikey, or we have a non-yubi pattern
    
    q = "%#{params[:search]}%"
    Book.where("title LIKE ? OR author LIKE ?", q, q)
  end

end
