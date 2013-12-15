class StaticPagesController < ApplicationController
  
  def index
  		@feedbacks = Feedback.paginate(page: params[:page], per_page: params[:per_page] || 15).order('votes_count DESC')
  		
  		respond_to do |format|
  			format.html
  			format.json { render json: @feedbacks }
  		end
  	
  end
end
