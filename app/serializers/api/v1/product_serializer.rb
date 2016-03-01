class Api::V1::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id, :price, :active, :inventory, :item, :set
end
