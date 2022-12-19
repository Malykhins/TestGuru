# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render inline: 'List of test questions: <%= @questions.pluck(:body) %>'
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new; end

  def create
    question = @test.questions.create(question_param)
    redirect_to question
  end

  def destroy
    @question.destroy
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_param
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
