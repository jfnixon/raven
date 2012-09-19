class CreateSignings < ActiveRecord::Migration
  def change
    create_table :signings do |t|
      t.string :image
      t.string :greeting

      t.timestamps
    end
  end
end
