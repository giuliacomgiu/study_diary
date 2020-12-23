class StudyItem < ApplicationRecord
  validates :title, presence: true

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
  belongs_to :type

  def complete?
    completed_at.present?
  end

  def late?
    return false if deadline.nil?

    completed_at > deadline if complete?
    Time.current > deadline
  end

  def categories
    super
      .pluck(:title)
      .to_sentence(two_words_connector: ', ', last_word_connector: ' e ')
  end
end
