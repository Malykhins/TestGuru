# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESSFUL_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    percentage_result >= SUCCESSFUL_RATE
  end

  def percentage_result
    self.correct_question.to_f / test.questions.count * 100
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
