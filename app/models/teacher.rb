require_relative '../../db/config'
require_relative 'subjects'

class Teacher < ActiveRecord::Base
    has_many :subjects, foreign_key: :teacher_id
	has_many :students, through: :subjects 

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Only valid email allowed."}
    validates :email, uniqueness: true

end

