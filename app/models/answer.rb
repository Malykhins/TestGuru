class Answer < ApplicationRecord
  belongs_to :question

  validate :body, presence: true
  validate :question, presence: true
  validate :validate_answers_limit, on: :create

  scope :correct_answers, -> { where(correct: true) }

  private

  def validate_answers_limit
    errors.add :answer if question.answers.count > 4
  end
end
