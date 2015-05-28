class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ''
      t.text :text, null: false, default: ''
      t.references :user_id, null: false, default: ''

      t.timestamps
    end

    add_index :posts, :title
  end
end
