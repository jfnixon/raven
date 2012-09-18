class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.text :yubikey
      t.references :user
      t.references :book

      t.timestamps
    end
    add_index :arts, :user_id
    add_index :arts, :book_id
  end
end
