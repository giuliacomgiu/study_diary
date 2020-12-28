class StudyItem < ApplicationRecord
  validates :title, presence: true

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
  belongs_to :type

  STATUS = { ongoing: 'em andamento',
             late: 'atrasado',
             complete: 'concluído',
             completed_late: 'concluído em atraso' }.freeze

  def categories
    super
      .pluck(:title)
      .to_sentence(two_words_connector: ', ', last_word_connector: ' e ')
  end

  # to do: find out how to name this description.preview
  def description_preview
    return if description.empty?

    description.slice(0..30).split.slice(0..-2).join(' ').concat '...'
  end

  def status
    if complete?
      STATUS[:complete]
    elsif !complete? && late?
      STATUS[:late]
    else
      STATUS[:ongoing]
    end
  end

  def complete?
    completed_at.present?
  end

  def late?
    return false if deadline.nil?

    completed_at > deadline if complete?
    Time.current > deadline
  end
end
