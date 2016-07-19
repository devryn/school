class School < ApplicationRecord
  has_many :teachers
  has_many :students, through: :teachers
  has_many :courses

end
