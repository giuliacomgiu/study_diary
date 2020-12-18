class StudyItem < ApplicationRecord
  validates :title, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :category

  def complete?
    completed_at.present?
  end

  def late?
    return false if deadline.nil?

    completed_at > deadline if complete?
    Time.current > deadline
  end

  # to do: find a better place for this
  def status_
    if complete? && late?
      'Concluído em atraso'
    elsif complete? && !late?
      'Concluído'
    elsif !complete? && late?
      'Atrasado'
    else
      'Em andamento'
    end
  end
end
