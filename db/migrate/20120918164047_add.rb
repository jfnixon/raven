class Add < ActiveRecord::Migration
  def up
    add_column :books, :title, :string
  end

  def down
    remove_column :books, :title
  end
end
