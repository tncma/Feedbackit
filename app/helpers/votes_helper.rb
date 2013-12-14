module VotesHelper

	def user_has_voted?(id)
		if current_user
			vote = current_user.votes.find_by_votable_id(id) 
		else
			false
		end
	end

end
