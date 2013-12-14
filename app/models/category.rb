class Category < ActiveRecord::Base
	has_many :feedbacks
	has_one :admin
end
