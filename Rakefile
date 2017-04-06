require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'
require_relative 'app/models/teacher'
require_relative 'app/models/student'
require_relative 'app/models/subjects'
require 'faker'

desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the students database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc "populate the teachers database with sample data"
task "db:populate_teacher" do
  9.times do
    Teacher.create(name:Faker::Name.name, phone:Faker::PhoneNumber.phone_number, email:Faker::Internet.email)
  end 
end

desc "populate the subjects database with sample data"
task "db:populate_subject" do
  s = Student.all.pluck(:id)
  t = Teacher.all.pluck(:id)
  20.times do
    Subject.create(student_id: s.sample, teacher_id: t.sample)
  end 
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs

desc 'Find the teacher"s students'
task "db:teacherfind" do 
  teacher = Teacher.find(9)
  p teacher.students
end 

desc 'Find the student"s teachers'
task "db:studentfind" do 
  student = Student.find(81)
  p student.teachers  
end 