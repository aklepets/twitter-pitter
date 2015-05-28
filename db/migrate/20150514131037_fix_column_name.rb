class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :posts, :user_id_id, :user_id
  end

  def down
  end
end
