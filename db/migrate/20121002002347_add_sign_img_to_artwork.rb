class AddSignImgToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :signing_img, :string, :default => ""
  end
end
