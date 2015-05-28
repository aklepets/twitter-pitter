class AddCommentsCountToUsers < ActiveRecord::Migration
  def up
    add_column :users, :comments_count, :integer, default: 0

    User.reset_column_information
    User.all.each do |p|
      p.update_attribute :comments_count, p.comments.length
    end
  end

  def down
    remove_column :users, :comments_count
  end
end
