class UsersController < ApplicationController

	before_filter :authenticate_user!

	def index
		@feedbacks = Feedback.where(user_id: current_user.id).paginate(page: params[:page], per_page: params[:per_page] || 15).order('created_at DESC')
	end

end
