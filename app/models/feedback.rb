class Feedback < ActiveRecord::Base
  belongs_to :category
  belongs_to :tag
end
