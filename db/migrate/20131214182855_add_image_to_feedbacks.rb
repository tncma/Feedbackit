class AddImageToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :image, :string
  end
end
