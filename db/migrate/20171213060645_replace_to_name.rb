require_relative '../config'
require_relative '../../app/models/student'

class ReplaceToName < ActiveRecord::Migration
	def up 
		add_column :students, :name, :string
		Student.all.each do |student|
			student.name = student.fullname
			student.save
		end

		remove_column :students, :first_name
		remove_column :students, :last_name
	end 

	def down 
		add_column :students, :first_name, :string
		add_column :students, :last_name, :string
		Student.all.each do |student|
			name = student.name.split(' ')
			student.first_name = name[0]
			student.last_name = name [1]
			student.save
		end 

		remove_column :students, :name
	end 
end 
