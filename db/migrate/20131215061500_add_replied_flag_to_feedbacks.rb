class AddRepliedFlagToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :replied, :boolean, default: false
  end
end
