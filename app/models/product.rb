class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :inventory
	has_many :orders
	accepts_nested_attributes_for :inventory
end
