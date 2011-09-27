class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :lastname
      t.integer :rut
      t.boolean :admin
      t.boolean :teacher
      t.boolean :student

      t.timestamps
    end
  end
end
