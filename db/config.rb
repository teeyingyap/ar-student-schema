require 'active_record'
require_relative '../app/models/student'
require_relative '../app/models/teacher'
require_relative '../app/models/subjects'
require_relative '../lib/students_importer'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-students.sqlite3")
