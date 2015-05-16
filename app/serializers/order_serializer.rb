class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :quantity, :size, :created_at

  has_one :user, root: :ordered_by

end
