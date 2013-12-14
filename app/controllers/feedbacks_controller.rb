class FeedbacksController < ApplicationController

	before_filter :authenticate_user!

	def new
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

		def feedback_parameters
			params.require(:feedback).permit(:feedback_content, :when, :where, :category_id, :tag_id)
		end

end
