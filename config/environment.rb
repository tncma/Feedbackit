# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
FeedbackIt::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 =>  587,
  :domain               => "codestacks.in@gmail.com",
  :user_name            => ENV["BLOGIO_USERNAME"],
  :password             => ENV["BLOGIO_PASSWORD"],
  :authentication       => "plain",
  :enable_starttls_auto => true  }