class FeedbacksController < ApplicationController

	before_filter :authenticate_user!

	def new
		@feedback = Feedback.new
		@categories = Category.all.map{|p| [ p.name, p.id]}  	
  		@categories.unshift ["Select Category","0"]
  		@tags = Tag.all.map{ |t| [ t.name, t.id ]}
  		@tags.unshift ["Select Type", "0"]
	end

	def create
		@feedback = Feedback.new feedback_parameters
		if @feedback.save!
			redirect_to root_url
		else
			render 'new'
		end
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
