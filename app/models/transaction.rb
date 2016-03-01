class Transaction < ActiveRecord::Base
	has_many :orders
	belongs_to :transaction_type, foreign_key: "type_id"
	belongs_to :user
	accepts_nested_attributes_for :orders, allow_destroy: true

	before_save :update_inventory

	def update_inventory
		@type = TransactionType.find(self.type_id) 
		if @type.name == "TRANSACTION_SALE"
			if self.void
				self.orders.each do | order |
					@inventory = Inventory.find(order.product_id)
					@inventory.quantity = @inventory.quantity + order.quantity
					@inventory.save()
				end
			else				
				self.orders.each do | order |
					@inventory = Inventory.find(order.product_id)
					@inventory.quantity = @inventory.quantity - order.quantity
					@inventory.save()
				end
			end
		end
		if @type.name == "TRANSACTION_ADD"
			self.orders.each do | order |
				@inventory = Inventory.find(order.product_id)
				@inventory.quantity = @inventory.quantity + order.quantity
				@inventory.save()
			end
		end
		if @type.name == "TRANSACTION_REMOVE"
			self.orders.each do | order |
				@inventory = Inventory.find(order.product_id)
				@inventory.quantity = @inventory.quantity - order.quantity
				@inventory.save()
			end
		end
		if @type.name == "TRANSACTION_SPOILED"
			self.orders.each do | order |
				@inventory = Inventory.find(order.product_id)
				@inventory.quantity = @inventory.quantity - order.quantity
				@inventory.save()
			end
		end

	end
end
