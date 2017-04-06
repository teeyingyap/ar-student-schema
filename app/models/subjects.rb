require_relative '../../db/config'
require_relative 'student'
require_relative 'teacher'

class Subject < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student
end