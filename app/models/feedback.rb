class Feedback < ActiveRecord::Base
  belongs_to :category
  belongs_to :tag
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :downvotes, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :heading, presence: true, length: { maximum: 100 }
  validates :feedback_content, presence: true, length: { minimum: 20 }
  validates_date :when, presence: true, on_or_before: :today
  validates_date :where, presence: true, length: { maximum: 100 }
  validates :category, presence: true
  validates :type, presence: true

  def send_mail(user)
  	FeedbackMailer.send_mail_to_user(user).deliver
  end

end
