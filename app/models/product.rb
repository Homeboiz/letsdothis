class Product < ActiveRecord::Base
	has_many :orders
	validates :description, length: { maximum: 20 }
end
