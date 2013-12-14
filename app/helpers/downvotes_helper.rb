module DownvotesHelper
	
	def user_has_downvoted?(id)
		downvote = current_user.downvotes.find_by_feedback_id(id) 
	end
end
