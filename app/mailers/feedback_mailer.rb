class FeedbackMailer < ActionMailer::Base
  default from: "support@feedbackit.com"

  def send_mail_to_user(user)
  		@user = user
  		mail(to: @user.email, subject: 'Feedback submission successful')
  end

  def send_reply_to_user(user, content)
		@user = user
		@content = content
		mail(to: @user.email, subject: 'Your Feedback has been addressed')  	
  end

end
