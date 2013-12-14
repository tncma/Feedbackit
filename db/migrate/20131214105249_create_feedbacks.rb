class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :feedback_content
      t.datetime :when
      t.string :where
      t.references :category, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
