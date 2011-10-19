class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :content
      t.float :nota
      t.boolean :active

      t.timestamps
    end
  end
end
