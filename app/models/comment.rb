class Comment < ApplicationRecord
  belongs_to :study_item

  validates :comment, presence: true
end
