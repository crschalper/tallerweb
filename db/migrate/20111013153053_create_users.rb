class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :lastname
      t.integer :rut
      t.string :type

      t.timestamps
    end
  end
end
