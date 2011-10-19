class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
