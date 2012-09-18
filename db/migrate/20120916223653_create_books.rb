class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :author
      t.text :image
      t.references :signing

      t.timestamps
    end
    add_index :books, :signing_id
  end
end
