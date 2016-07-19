class Teacher < ApplicationRecord
  belongs_to :schooln
  has_many :students
end
