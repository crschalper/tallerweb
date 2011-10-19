class AddCursoToUser < ActiveRecord::Migration
  def change
    add_column :users, :curso_id, :integer
  end
end
