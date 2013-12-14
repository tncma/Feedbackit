class StaticPagesController < ApplicationController
  def index
  	@feedbacks = Feedback.all
  end
end
