class AddLimitedEditionCount < ActiveRecord::Migration
  def up
    add_column :arts, :le_count, :integer
    add_column :books, :le_max, :integer
    add_column :books, :le_desc, :string
  end

  def down
    remove_column :arts, :le_count
    remove_column :books, :le_max
    remove_column :books, :le_desc
  end
end
