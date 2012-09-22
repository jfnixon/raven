class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :image, :default => ""
      t.integer :edition_size, :default => 1
      t.string :edition_desc, :default => ""

      t.timestamps
    end
  end
end
