class StaticPagesController < ApplicationController
  def index
  	@feedbacks = Feedback.paginate(page: params[:page], per_page: params[:per_page] || 15).order(:created_at, :updated_at)
  	#@feedbacks = Feedback.all
  	respond_to do |format|
  		format.html
  		format.json { render json: @feedbacks }
  	end
  end
end
