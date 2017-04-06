require_relative '../../db/config'
require_relative 'subjects'

class Student < ActiveRecord::Base
  has_many :subjects, foreign_key: :student_id
  has_many :teachers, through: :subjects 
# implement your Student model here
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Only valid email allowed."}
  validates :email, uniqueness: true
  validate :must_not_be_toddler 
  validate :phone_must_have_ten_numbers


  def fullname 
  	"#{first_name} #{last_name}"
  	#also can use first_name + " " + last_name
  end 

  def age 
    @age = Date.today.year - birthday.year
    @age -= 1 if Date.today < birthday + @age.year #for days before birthday
    return @age
  end 


  def must_not_be_toddler
	if age < 5
		errors.add(:student, "can't be a toddler")
	end 
  end 

  def phone_must_have_ten_numbers
	unless phone.scan(/\d/).length >= 10 
		errors.add(:phone, "is too short, must have at least 10 numbers")
	end 
  end 

end

