class Downvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :downvotable, polymorphic: true
end
