# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(tests_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(tests_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
