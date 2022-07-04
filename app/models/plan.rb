class Plan < ApplicationRecord
	validates :plan_name, presence: true
	validates :plan_description , presence: true , length: { in: 6..100 } 
	has_many :users
end
