class StaticPagesController < ApplicationController
  def index
  	@feedbacks = Feedback.all
  	respond_to do |format|
  		format.html
  		format.json { render json: @feedbacks }
  	end
  end
end
