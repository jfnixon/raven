class CreateSignings < ActiveRecord::Migration
  def change
    create_table :signings do |t|
      t.text :image
      t.text :greeting

      t.timestamps
    end
  end
end
