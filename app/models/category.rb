class Category < ApplicationRecord
  has_many :study_items

  validates :title, presence: true
end
