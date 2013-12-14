class VotesController < ApplicationController

	before_filter :find_votable, only: [:create]

	def create
		vote = Vote.new
		vote.votable = @votable
		vote.user = current_user
		vote.save!

		find_votable

		respond_to do |format|
			format.js
		end

	end

	def destroy
		
	end

	def find_votable
		votable_id = params[:votable_id] || @votable_id
		votable_type = params[:votable_type] || @votable_type

		if user_signed_in?
			if votable_type == "Feedback"
				@votable = Feedback.find_by_id(votable_id)
			end	
		end
	end

end
