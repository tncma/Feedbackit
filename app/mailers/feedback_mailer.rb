class FeedbackMailer < ActionMailer::Base
  default from: "support@feedbackit.com"

  def send_mail_to_user(user)
  		@user = user
  		mail(to: @user.email, subject: 'Feedback submission successful')
  end

end
