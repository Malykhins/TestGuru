class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end

  def send_feedback(feedback)
    @feedback = feedback

    mail to: 's.malyhin@inbox.ru', subject: "Feedback from the #{@feedback.name}."
  end
end
