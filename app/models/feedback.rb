class Feedback < ActiveRecord::Base
  belongs_to :category
  belongs_to :tag
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy
  has_many :downvotes, as: :downvotable, dependent: :destroy

  mount_uploader :image, ImageUploader

end
