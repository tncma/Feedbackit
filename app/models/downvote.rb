class Downvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :feedback
end
