class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author
      t.string :image
      t.integer :edition_size
      t.string :edition_desc
      t.references :artworks

      t.timestamps
    end
  end
end
