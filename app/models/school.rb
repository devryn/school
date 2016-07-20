class School < ApplicationRecord
  has_many :teachers, dependent: :destroy
  has_many :students, through: :teachers, dependent: :destroy
  has_many :courses

end
