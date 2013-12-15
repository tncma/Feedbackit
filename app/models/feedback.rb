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
  validates :where, presence: true, length: { maximum: 100 }
  validates :category, presence: true
  validates :tag, presence: true

  def send_mail(user)
  	FeedbackMailer.send_mail_to_user(user).deliver
  end

  def send_reply(user, content)
    FeedbackMailer.send_reply_to_user(user, content).deliver
  end

end
