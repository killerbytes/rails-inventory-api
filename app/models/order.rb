class Order < ActiveRecord::Base
	belongs_to :product
  	belongs_to :owner, foreign_key: "transaction_id", class_name: "Transaction"
end
