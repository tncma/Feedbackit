class AddHeadingToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :heading, :string
  end
end
