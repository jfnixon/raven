class FixYubiKey < ActiveRecord::Migration
  def change
    rename_column :limited_editions, :yubi_otp, :yubi_key
  end
end
