class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.integer :post_id
      t.string :path

      t.timestamps
    end
  end
end
