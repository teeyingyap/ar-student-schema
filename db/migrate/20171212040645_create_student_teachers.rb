require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateStudentTeachers < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :subjects do |t|
    	t.integer :student_id
    	t.integer :teacher_id
      t.string :name 
    	t.timestamps
   end
      # add columns that you would need for this table
   end
end
