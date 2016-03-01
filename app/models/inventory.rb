class Inventory < ActiveRecord::Base
	has_one :product
end
