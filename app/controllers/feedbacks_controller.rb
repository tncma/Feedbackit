class FeedbacksController < ApplicationController

	before_filter :auth_user!, except: [:show]
	before_filter :collect_data, only: [:new]

	def new
		@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.new feedback_parameters
		@feedback.user = current_user
		
		@feedback.save!
		@feedback.send_mail(@feedback.user)
		
		respond_to do |format|
			format.js
		end
	end

	def show
		@feedback = Feedback.find(params[:id])
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		@feedback = Feedback.find(params[:id])
		@feedback.destroy
		redirect_to root_url
	end

	def auth_user!(opts = {})
  		if admin_signed_in?
   			authenticate_admin!
  		else
    		authenticate_user!
  		end
	end


	private

		def collect_data
			@categories = Category.all
	  		@tags = Tag.all
		end

		def feedback_parameters
			params.require(:feedback).permit(:heading,:feedback_content, :when, :where, :category_id, :tag_id, :image)
		end

end
