class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  # has_many :orders, :serializer => ShortOrderSerializer

end
