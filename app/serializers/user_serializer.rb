class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :street1, :street2, :city, :state, :zip

  # has_many :orders, :serializer => ShortOrderSerializer

end
