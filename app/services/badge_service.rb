class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @category = test_passage.test.category
  end

  def check_the_test_passed_with_a_100_percent_result?
    @test_passage.percentage_result == 100 && TestPassage.where(user: @user, test: @test).count == 1
  end

  def check_all_tests_from_the_category_passed?
    Test.where(category: @category).count == @user.tests.where(category: @category).distinct.count &&
      TestPassage.where(user: @user, test: @test).count == 1
  end

end