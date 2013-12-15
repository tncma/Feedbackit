class VotesController < ApplicationController

	before_filter :authenticate_user!

	def create
		@feedback = Feedback.find(params[:feedback_id])
		@vote = @feedback.votes.new do |vote|
			vote.user = current_user
		end
		
		if(downvote = current_user.downvotes.find_by_feedback_id @feedback.id)
            downvote.destroy!
        end

        @vote.save!

        @feedback.update_attribute(:votes_count, get_votes_count)

		respond_to do |format|
			format.js
		end
	end

	def destroy
		@feedback = Feedback.find(params[:feedback_id])
		vote = Vote.find(params[:id])
		vote.destroy

		@feedback.update_attribute(:votes_count, get_votes_count)

		respond_to do |format|
			format.js
		end
	end

	def get_votes_count
		votes_count = @feedback.votes.count - @feedback.downvotes.count
	end

end
