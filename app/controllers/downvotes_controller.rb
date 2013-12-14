class DownvotesController < ApplicationController

	before_filter :authenticate_user!

	def create
		@feedback = Feedback.find(params[:feedback_id])
		@downvote = @feedback.downvotes.new do |downvote|
			downvote.user = current_user
		end
		
		if(vote = current_user.votes.find_by_feedback_id @feedback.id)
            vote.destroy!
        end

		respond_to do |format|
			format.js
		end
	end

	def destroy
		@feedback = Feedback.find(params[:feedback_id])
		downvote = Downvote.find(params[:id])
		downvote.destroy

		respond_to do |format|
			format.js
		end
	end

end
