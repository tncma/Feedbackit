class DownvotesController < ApplicationController

	before_filter :find_downvotable, only: [:create]

	def create
		downvote = Downvote.new
		downvote.downvotable = @downvotable
		downvote.user = current_user

		if(vote = current_user.votes.find_by_votable_id_and_votable_type(@downvotable.id, "Feedback"))
			vote.destroy!
		end

		downvote.save!

		find_downvotable

		respond_to do |format|
			format.js
		end

	end

	def destroy
		
	end

	def find_downvotable
		downvotable_id = params[:downvotable_id] || @downvotable_id
		downvotable_type = params[:downvotable_type] || @downvotable_type

		if user_signed_in?
			if downvotable_type == "Feedback"
				@downvotable = Feedback.find_by_id(downvotable_id)
			end	
		end
	end

end
