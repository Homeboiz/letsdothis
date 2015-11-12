class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments
	validates :description, length: { maximum: 20 }
end
