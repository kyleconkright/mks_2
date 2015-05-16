class ShortOrderSerializer < ActiveModel::Serializer
	attributes :id, :status, :size, :quantity
end