class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      TestsMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: 'Your message has been sent to the administrator!'
    else
      render :new, alert: 'The message was not sent!'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:message).merge(name: current_user.first_name,
                                                     email: current_user.email)
  end
end
