module VotesHelper

	def user_has_voted?(id)
		vote = current_user.votes.find_by_votable_id(id) 
	end

end
