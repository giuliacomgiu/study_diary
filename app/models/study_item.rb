class StudyItem < ApplicationRecord
  has_many :comments, dependent: :destroy
end
