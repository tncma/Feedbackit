class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.references :feedback, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
