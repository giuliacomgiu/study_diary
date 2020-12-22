class Category < ApplicationRecord
  has_and_belongs_to_many :study_items

  validates :title, presence: true
end
