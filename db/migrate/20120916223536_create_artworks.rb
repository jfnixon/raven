class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :yubikey
      t.string :personal_msg
      t.integer :work_number
      t.references :signing
      t.references :user
      t.references :book

      t.timestamps
    end
    add_index :artworks, :user_id
    add_index :artworks, :book_id
  end
end
