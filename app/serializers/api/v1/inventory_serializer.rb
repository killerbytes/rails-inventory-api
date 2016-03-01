class Api::V1::InventorySerializer < ActiveModel::Serializer
  attributes :id, :quantity, :product
end
