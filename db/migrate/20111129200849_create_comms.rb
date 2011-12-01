class CreateComms < ActiveRecord::Migration
  def change
    create_table :comms do |t|
      t.integer :father_id
      t.integer :son_id

      t.timestamps
    end
  end
end
