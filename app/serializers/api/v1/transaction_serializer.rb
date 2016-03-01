class Api::V1::TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :type_id, :notes, :user_id, :transaction_type, :orders, :created_at, :void, :user
end
