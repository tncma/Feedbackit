class Feedback < ActiveRecord::Base
  belongs_to :category
  belongs_to :tag
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :downvotes, dependent: :destroy

  mount_uploader :image, ImageUploader

end
