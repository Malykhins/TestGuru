# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_param)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test.id)
  end

  def edit; end

  def update
    if @question.update(question_param)
      redirect_to @question
    else
      render :edit
    end
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_param
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
