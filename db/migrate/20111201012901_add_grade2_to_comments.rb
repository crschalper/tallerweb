class AddGrade2ToComments < ActiveRecord::Migration
  def change
	  	      add_column :comments, :grade2, :float

  end
end
