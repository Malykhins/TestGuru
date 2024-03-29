# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist check_timer]

  def show; end

  def result
    @user_badges = session[:user_badges]
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now

      session[:user_badges] = if Badge.any?
                                current_user.award(@test_passage)
                              end

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.success?
      Gist.create!(gist_params)
      flash[:notice] = "#{ t('.success') } #{ view_context.link_to 'Gist', @result.html_url}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_params
    { user_id: @test_passage.user.id,
      question_id: @test_passage.current_question.id,
      gist_url: @result.html_url }
  end
end
