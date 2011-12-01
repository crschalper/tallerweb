class AddGradeToComments < ActiveRecord::Migration
  def change
	      add_column :comments, :grade, :integer

  end
end
