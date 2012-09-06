class CreateLimitedEditions < ActiveRecord::Migration
  def change
    create_table :limited_editions do |t|
      t.string :title
      t.string :creator
      t.string :yubi_otp

      t.timestamps
    end
  end
end
