class Feedback < ActiveRecord::Base
  belongs_to :category
  belongs_to :tag
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :downvotes, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :heading, presence: true, length: { maximum: 100 }
  validates :feedback_content, presence: true, length: { minimum: 20 }

  def send_mail(user)
  	FeedbackMailer.send_mail_to_user(user).deliver
  end

end
