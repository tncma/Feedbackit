class Votes < ActiveRecord::Base
  belongs_to :votable, polymorphic: true,counter_cache: true
  belongs_to :user
end
