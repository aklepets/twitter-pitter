class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text, null: false, default: ''
      t.references :user, null: false, default: ''
      t.references :post, null: false, default: ''

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
