class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :content
      t.float :nota

      t.timestamps
    end
  end
end
