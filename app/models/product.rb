class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments
	validates :description, length: { maximum: 20 }
	validates :name, presence: true 


	def average_rating 
		comments.average(:rating).to_f
	end 
end
