class StudyItem < ApplicationRecord
  validates :title, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :type

  def complete?
    completed_at.present?
  end

  def late?
    return false if deadline.nil?

    completed_at > deadline if complete?
    Time.current > deadline
  end
end
