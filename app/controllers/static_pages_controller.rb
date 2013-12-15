class StaticPagesController < ApplicationController
  
  def index
  		@feedbacks = Feedback.paginate(page: params[:page], per_page: params[:per_page] || 15).order('votes_count DESC')
  		@categories = Category.all
  end

  def sort
  	@category = params[:static_pages][:category]
  	@categories = Category.all
  	@feedbacks = Feedback.where(category_id: @category).paginate(page: params[:page], per_page: params[:per_page] || 15).order('votes_count DESC')
  end
end
