class Api::V1::OrderSerializer < ActiveModel::Serializer
  attributes :id, :transaction_id, :price, :quantity, :product
end
