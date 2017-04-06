require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateTeachers < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :teachers do |t|
    	t.string :name
    	t.string :email
    	t.string :phone 
    	t.timestamps
   end
      # add columns that you would need for this table
   end
end
