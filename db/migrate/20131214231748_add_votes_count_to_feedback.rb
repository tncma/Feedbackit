class AddVotesCountToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :votes_count, :integer, default: 0
  end
end
