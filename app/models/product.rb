class Product < ActiveRecord::Base
	validates :description, length: { maximum: 20 }
end
