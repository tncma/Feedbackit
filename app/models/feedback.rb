class Feedback < ActiveRecord::Base
  belongs_to :category
  belongs_to :tag
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy
end
