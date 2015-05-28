class AddPostsCount < ActiveRecord::Migration
  def up
    add_column :users, :posts_count, :integer, default: 0

    User.reset_column_information
    User.all.each do |p|
      p.update_attribute :posts_count, p.posts.length
    end
  end

  def down
    remove_column :users, :posts_count
  end
end
