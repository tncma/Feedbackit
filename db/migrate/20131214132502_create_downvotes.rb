class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.integer :downvotable_id
      t.string :downvotable_type
      t.references :user, index: true

      t.timestamps
    end
  end
end
